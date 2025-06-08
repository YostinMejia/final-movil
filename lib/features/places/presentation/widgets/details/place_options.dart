import 'package:flutter/material.dart';

class PlaceOptions extends StatelessWidget {
  const PlaceOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                    (i) => Icon(
                      Icons.star,
                      color: i < 4 ? Colors.amber : Colors.grey,
                      size: 16,
                    ),
                  ),
                ),
                const Text("Usuario"),
                const Text("Comentario de ejemplo sobre el lugar..."),
              ],
            ),
          ),
        );
      },
    );
  }
}
