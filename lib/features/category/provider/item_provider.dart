import 'package:chiva_exp/features/category/infraestructure/item_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemDatasourceProvider = Provider<ItemDatasource>((ref) {
  return ItemDatasource();
});

final itemsByCategoryProvider = FutureProvider.family((ref, String categoryId) {
  final datasource = ref.read(itemDatasourceProvider);
  return datasource.fetchItemsByCategory(categoryId);
});
