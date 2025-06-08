import 'package:chiva_exp/features/places/presentation/place_detail_screen.dart';
import 'package:chiva_exp/features/places/presentation/widgets/no_places_found.dart';
import 'package:chiva_exp/features/places/presentation/widgets/place_card.dart';
import 'package:chiva_exp/features/places/provider/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceScreen extends ConsumerWidget {
  const PlaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeAsyncValue = ref.watch(placesProvider);

    return placeAsyncValue.when(
      data: (places) {
        return places.isEmpty
            ? NoPlacesFound()
            : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 0.8,
              mainAxisSpacing: 0.8,
              children:
                  places.map((place) {
                    return PlaceCard(place: place, onTap: navigateToPlace);
                  }).toList(),
            );
      },
      error: (error, stack) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

void navigateToPlace(BuildContext context, String placeId) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PlaceDetailScreen(placeId: placeId),
    ),
  );
}
