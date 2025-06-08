import 'package:chiva_exp/features/category/infraestructure/datasource/category_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryDatasourceProvider = Provider<CategoryDatasource>((ref) {
  return CategoryDatasource();
});

final categoriesFutureProvider = FutureProvider((ref) {
  final datasource = ref.read(categoryDatasourceProvider);
  return datasource.fetchCategories();
});
