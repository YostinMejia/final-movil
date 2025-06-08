import 'package:chiva_exp/features/places/domain/model/place.dart';
import 'package:chiva_exp/features/places/infrastructure/datasource/place_local_datasource.dart';
import 'package:chiva_exp/features/places/infrastructure/datasource/place_online_datasource.dart';

class PlaceRepository {
  final PlaceOnlineDatasource placeOnlineDatasource;
  final PlaceLocalDatasource placeLocalDatasource;
  const PlaceRepository({
    required this.placeOnlineDatasource,
    required this.placeLocalDatasource,
  });

  Future<List<Place>> getPlaces() async {
    final placesOnline = await placeOnlineDatasource.fetchPlaces();
    if (placesOnline.isNotEmpty) {
      placeLocalDatasource.savePlaces(placesOnline);
      return placesOnline;
    }
    return await placeLocalDatasource.fetchPlaces();
  }

  Future<Place?> getPlaceById(String id) async {
    final placeOnline = await placeOnlineDatasource.fetchProductById(id);
    if (placeOnline != null) {
      return placeOnline;
    }
    final placeLocal = await placeLocalDatasource.fetchProductById(id);
    return placeLocal;
  }
}
