import 'package:chiva_exp/features/places/domain/model/place.dart';
import 'package:chiva_exp/features/places/infrastructure/datasource/place_online_datasource.dart';
import 'package:chiva_exp/features/places/infrastructure/repository/place_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final placeRepositoryProvider = Provider<PlaceRepository>((ref){
  final PlaceOnlineDatasource placeDatasource = PlaceOnlineDatasource(); 
  return PlaceRepository(placeOnlineDatasource: placeDatasource);

});

final placeProvider = FutureProvider<List<Place>>((ref)async{
  final placeService = ref.watch(placeRepositoryProvider);
  return await placeService.getPlaces();
});