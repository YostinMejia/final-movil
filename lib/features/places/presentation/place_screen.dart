library place_screen;

import 'package:flutter/material.dart';
import 'package:chiva_exp/features/places/domain/model/place.dart';
import 'package:chiva_exp/features/places/presentation/place_detail_screen.dart';
import 'package:chiva_exp/features/places/presentation/widgets/no_places_found.dart';
import 'package:chiva_exp/features/places/presentation/widgets/place_card.dart';

class PlaceScreen extends StatelessWidget {
  final List<Place> places;

  const PlaceScreen({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const NoPlacesFound();
    }

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 0.8,
      mainAxisSpacing: 0.8,
      children: places.map((place) {
        return PlaceCard(
          place: place,
          onTap: (ctx, p) => _navigateToDetail(ctx, place),
        );
      }).toList(),
    );
  }

  void _navigateToDetail(BuildContext context, Place place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlaceDetailScreen(placeId: place.id),
      ),
    );
  }
}