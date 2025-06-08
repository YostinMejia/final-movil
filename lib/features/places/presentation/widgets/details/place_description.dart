import 'package:flutter/material.dart';

class PlaceDescription extends StatelessWidget {
  final String description;
  const PlaceDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
