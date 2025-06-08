import 'package:flutter/material.dart';

class PlaceDescription extends StatelessWidget {
  const PlaceDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Text(
        "Descripción detallada del lugar...",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
