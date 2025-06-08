import "package:chiva_exp/features/home/widgets/custom_app_bar.dart";
import "package:chiva_exp/features/places/presentation/widgets/details/detail_tab_options.dart";
import "package:chiva_exp/features/places/presentation/widgets/no_places_found.dart";
import "package:chiva_exp/features/places/presentation/widgets/details/place_image_slide.dart";
import "package:chiva_exp/features/places/provider/place_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PlaceDetailScreen extends ConsumerWidget {
  final String placeId;
  const PlaceDetailScreen({super.key, required this.placeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeAsyncValue = ref.watch(placeProvider(placeId));

    return Scaffold(
      appBar: CustomAppBar(),
      body: placeAsyncValue.when(
        data: (place) {
          return place == null
              ? NoPlacesFound()
              : SafeArea(
                child: Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      place.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    PlaceImagesSlide(
                      imagesUrls: [
                        place.principalImageUrl,
                        ...place.secondaryImagesUrls,
                      ],
                    ),
                    const Expanded(child: TabOptions()),
                  ],
                ),
              );
        },
        error: (error, stack) => Center(child: Text('Error: $error')),
        loading:
            () => const SizedBox(
              width: double.infinity,
              height: 400,
              child: Center(child: CircularProgressIndicator()),
            ),
      ),
    );
  }
}
