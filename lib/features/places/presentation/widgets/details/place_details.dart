import 'package:flutter/material.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text("Horario de atención"),
          subtitle: Text("9:00 AM - 6:00 PM"),
        ),
        ListTile(
          leading: Icon(Icons.attach_money),
          title: Text("Precio promedio"),
          subtitle: Text("\$25,000 COP"),
        ),
      ],
    );
  }
}
