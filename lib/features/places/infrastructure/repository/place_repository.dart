import 'package:chiva_exp/features/places/domain/model/place.dart';
import 'package:chiva_exp/features/places/infrastructure/datasource/place_online_datasource.dart';

class PlaceRepository {
  final PlaceOnlineDatasource placeOnlineDatasource;
  const PlaceRepository({required this.placeOnlineDatasource});

  Future<List<Place>> getPlaces() {
    return placeOnlineDatasource.fetchPlaces();
  }

  Future<Place?> getPlaceById(String id) {
    return placeOnlineDatasource.fetchProductById(id);
  }
}
