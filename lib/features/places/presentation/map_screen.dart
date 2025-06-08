import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

// Define the Place class
class Place {
  final String id;
  final String name;
  final double latitude;
  final double longitude;

  Place({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final LatLng _initialCenter = LatLng(6.2442, -75.5812);
  final List<Place> _places = [];
  final PopupController _popupController = PopupController();

  @override
  void initState() {
    super.initState();
    _loadTouristPlaces();
  }

  Future<void> _loadTouristPlaces() async {
    final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search.php'
        '?q=attractions+near+Medellin'
        '&format=jsonv2'
        '&accept-language=en'
        '&email=your@email.com');

    final response = await http.get(uri, headers: {'User-Agent': 'FlutterApp'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      const dist = Distance();

      setState(() {
        _places.clear();
        for (var item in data) {
          final lat = double.tryParse(item['lat'] ?? '') ?? 0.0;
          final lon = double.tryParse(item['lon'] ?? '') ?? 0.0;
          final point = LatLng(lat, lon);

          if (dist.as(LengthUnit.Kilometer, _initialCenter, point) <= 5) {
            _places.add(
              Place(
                id: item['osm_id']?.toString() ?? point.toString(),
                name: item['display_name'] ?? 'Unknown',
                latitude: lat,
                longitude: lon,
              ),
            );
          }
        }
      });
    } else {
      debugPrint('Error fetching places: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mapa de Atracciones')),
      body: FlutterMap(
        options: MapOptions(
          center: _initialCenter,
          zoom: 13.0,
          onTap: (_, __) => _popupController.hideAllPopups(),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.yourcompany.app',
          ),
          PopupMarkerLayerWidget(
            options: PopupMarkerLayerOptions(
              markers: _places.map((p) => Marker(
                width: 40,
                height: 40,
                point: LatLng(p.latitude, p.longitude),
                builder: (ctx) => const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 30,
                ),
              )).toList(),
              popupController: _popupController,
              popupBuilder: (BuildContext ctx, Marker marker) {
                final place = _places.firstWhere(
                  (pl) => pl.latitude == marker.point.latitude && pl.longitude == marker.point.longitude,
                  orElse: () => Place(id: '', name: 'Unknown', latitude: marker.point.latitude, longitude: marker.point.longitude),
                );
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      place.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}