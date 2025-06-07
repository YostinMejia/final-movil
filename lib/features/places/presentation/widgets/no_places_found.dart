import 'package:flutter/material.dart';

class NoPlacesFound extends StatelessWidget {
  const NoPlacesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center ,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.do_not_disturb_alt_sharp),
          Text("No hay sitios turísticos"),
        ],
      ),
    );
  }
}
