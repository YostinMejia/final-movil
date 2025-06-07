import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final num stars;
  const RatingStars({super.key, required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (int index) {
        if (index < stars.floor()) {
          return Icon(Icons.star, color: Colors.amber);
        } else if (index + 0.5 <= stars) {
          return Icon(Icons.star_half, color: Colors.amber);
        } else {
          return Icon(Icons.star_border, color: Colors.grey);
        }
      }),
    );
  }
}