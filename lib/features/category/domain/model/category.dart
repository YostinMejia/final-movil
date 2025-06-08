import 'package:flutter/material.dart';

class Category {
  final String id; // 🔹 Nuevo campo
  final String name;
  final IconData icon;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
