import 'dart:convert';

import 'package:chiva_exp/features/places/domain/datasource/place_datasource.dart';
import 'package:chiva_exp/features/places/domain/model/place.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaceLocalDatasource implements PlaceDatasource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<void> savePlaces(List<Place> places) async {
    final List<String> placesEncoded =
        places.map((place) => jsonEncode(place.toJson())).toList();
    await asyncPrefs.setStringList("places", placesEncoded);
  }

  @override
  Future<List<Place>> fetchPlaces() async {
    final placesEncoded = await asyncPrefs.getStringList("places");
    if (placesEncoded == null) {
      return [];
    }

    return placesEncoded
        .map((placeEncoded) => Place.fromJson(jsonDecode(placeEncoded)))
        .toList();
  }

  @override
  Future<Place?> fetchProductById(String id) async {
    final placesEncoded = await asyncPrefs.getStringList("places");
    if (placesEncoded == null) {
      return null;
    }
    final placeJson = placesEncoded.firstWhere(
      (placeEncoded) => jsonDecode(placeEncoded)["id"] == id,
      orElse: () => "",
    );
    return placeJson.isEmpty ? null : Place.fromJson(jsonDecode(placeJson));
  }
}
