import 'package:flutter/material.dart';
import '../../domain/model/category.dart';

class CategoryDatasource {
  Future<List<Category>> fetchCategories() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Category(
        id: '1',
        name: 'Restaurantes',
        icon: Icons.restaurant,
        color: Colors.orange,
      ),
      Category(
        id: '2',
        name: 'Parques',
        icon: Icons.park,
        color: Colors.green,
      ),
      Category(
        id: '3',
        name: 'Hoteles',
        icon: Icons.hotel,
        color: Colors.blue,
      ),
    ];
  }
}
