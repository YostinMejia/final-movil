import 'package:flutter/material.dart';

class PlaceImagesSlide extends StatelessWidget {
  final List<String> imagesUrls;
  const PlaceImagesSlide({super.key, required this.imagesUrls});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagesUrls.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 20,
            width: 380,
            child: LoadImageNetwork(url: imagesUrls[index]),
          );
        },
      ),
    );
  }
}

class LoadImageNetwork extends StatelessWidget {
  final String url;
  const LoadImageNetwork({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: Colors.grey.shade200,
          child: Center(
            child: CircularProgressIndicator(
              value:
                  loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
            ),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey.shade200,
          child: const Icon(Icons.image_not_supported),
        );
      },
    );
  }
}
