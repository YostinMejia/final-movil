import 'package:chiva_exp/features/places/domain/model/place.dart';
import 'package:chiva_exp/features/places/infrastructure/datasource/place_local_datasource.dart';
import 'package:chiva_exp/features/places/infrastructure/datasource/place_online_datasource.dart';
import 'package:chiva_exp/features/places/infrastructure/repository/place_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final placeRepositoryProvider = Provider<PlaceRepository>((ref) {
  final PlaceOnlineDatasource placeOnlineDatasource = PlaceOnlineDatasource();
  final PlaceLocalDatasource placeLocalDatasource = PlaceLocalDatasource();
  return PlaceRepository(
    placeOnlineDatasource: placeOnlineDatasource,
    placeLocalDatasource: placeLocalDatasource,
  );
});

final placesProvider = FutureProvider<List<Place>>((ref) async {
  final placeService = ref.watch(placeRepositoryProvider);
  return await placeService.getPlaces();
});

final placeProvider = FutureProvider.family<Place?, String>((ref, id) async {
  final placeService = ref.watch(placeRepositoryProvider);
  return await placeService.getPlaceById(id);
});
