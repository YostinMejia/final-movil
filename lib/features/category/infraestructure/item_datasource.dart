import 'package:chiva_exp/features/category/domain/model/item.dart';
import 'package:flutter/material.dart';

class ItemDatasource {
  Future<List<Item>> fetchItemsByCategory(String categoryId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    // Simulación simple basada en categoryId
    switch (categoryId) {
      case '1': // Restaurantes
        return [
          Item(title: 'Pizza Loca', color: Colors.orange.shade200),
          Item(title: 'Sushi Bar', color: Colors.orange.shade300),
        ];
      case '2': // Parques
        return [
          Item(title: 'Parque Central', color: Colors.green.shade200),
          Item(title: 'Eco Reserva', color: Colors.green.shade300),
        ];
      case '3': // Hoteles
        return [
          Item(title: 'Hotel Luna', color: Colors.blue.shade200),
          Item(title: 'Resort del Sol', color: Colors.blue.shade300),
        ];
      default:
        return [];
    }
  }
}
