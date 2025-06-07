import 'package:chiva_exp/features/home/home.dart';
import 'package:chiva_exp/features/places/presentation/place_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(pages: [Placeholder(),PlaceScreen(places: []),Placeholder(), Placeholder()],)
    );
  }
}

