import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  final Map<String, dynamic> details;
  const PlaceDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final String schedule = details['schedule'] ?? 'No disponible';
    final String price = details['averagePrice']?.toString() ?? 'No disponible';

    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.access_time),
          title: const Text("Horario de atención"),
          subtitle: Text(schedule),
        ),
        ListTile(
          leading: const Icon(Icons.attach_money),
          title: const Text("Precio promedio"),
          subtitle: Text("\$$price COP"),
        ),
      ],
    );
  }
}
