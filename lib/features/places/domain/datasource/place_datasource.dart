import 'package:chiva_exp/features/places/domain/model/place.dart';

abstract class PlaceDatasource {
  Future<List<Place>> fetchPlaces();
  Future<Place?> fetchProductById(String id);
}