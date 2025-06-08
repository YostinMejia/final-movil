import 'package:chiva_exp/features/places/domain/datasource/place_datasource.dart';
import 'package:chiva_exp/features/places/domain/model/place.dart';

class PlaceOnlineDatasource extends PlaceDatasource {
  static const List<Map<String, dynamic>> _mockPlaces = [
    {
      "id": "1",
      "principalImageUrl":
          "https://www.medellin.travel/wp-content/uploads/2020/10/Botero-1024x1024.jpg",
      "secondaryImagesUrls": [
        "https://upload.wikimedia.org/wikipedia/commons/5/5a/Plaza_Botero_2019.jpg",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/33/f8/df/plaza-botero.jpg",
        "https://media-cdn.tripadvisor.com/media/photo-s/1b/31/19/1d/plaza-botero.jpg",
      ],
      "name": "Plaza Botero",
      "promPrice": 0,
      "stars": 4.3,
      "description":
          "Iconic square featuring 23 bronze sculptures by Fernando Botero",
      "location": "Medellín City Center",
      "isFree": true,
      "openingHours": "24/7",
      "category": "Cultural",
    },
    {
      "id": "2",
      "principalImageUrl":
          "https://raw.githubusercontent.com/JhamG9/api-viaja/main/uploads/parque-explora-medellin/dinosaurios-parque-explora.webp",
      "secondaryImagesUrls": [
        "https://upload.wikimedia.org/wikipedia/commons/9/9e/Parque_Explora_-_Medell%C3%ADn.jpg",
        "https://www.parqueexplora.org/wp-content/uploads/2023/06/parque-explora-1.jpg",
        "https://media-cdn.tripadvisor.com/media/photo-s/0e/86/4e/6c/parque-explora.jpg",
      ],
      "name": "Parque Explora",
      "promPrice": 35000,
      "stars": 4.6,
      "description": "Interactive science museum with aquarium and planetarium",
      "location": "North Zone",
      "isFree": false,
      "openingHours": "Tue-Fri 9AM-6PM, Sat-Sun 10AM-7PM",
      "category": "Educational",
    },
    {
      "id": "3",
      "principalImageUrl":
          "https://fundacionferrocarrildeantioquia.com/wp-content/uploads/2023/05/20.jpg",
      "secondaryImagesUrls": [
        "https://upload.wikimedia.org/wikipedia/commons/4/4b/Cerro_Nutibara_-_Pueblito_Paisa.jpg",
        "https://media-cdn.tripadvisor.com/media/photo-s/0b/35/2b/6e/cerro-nutibara.jpg",
        "https://www.colombia.co/wp-content/uploads/2017/03/cerro-nutibara.jpg",
      ],
      "name": "Cerro Nutibara",
      "promPrice": 5000,
      "stars": 4.2,
      "description":
          "Hilltop replica of a traditional Antioquian village with city views",
      "location": "La Candelaria",
      "isFree": false,
      "openingHours": "8AM-10PM Daily",
      "category": "Cultural",
    },
    {
      "id": "4",
      "principalImageUrl":
          "https://centrodemedellin.co/imagenes/imagenesPagina/Cont_52_Museo%20De%20Antioquia/museoaAntppal2.jpg",
      "secondaryImagesUrls": [
        "https://upload.wikimedia.org/wikipedia/commons/7/7e/Museo_de_Antioquia_-_Plaza_Botero.jpg",
        "https://www.museodeantioquia.co/wp-content/uploads/2023/06/museo-de-antioquia-1.jpg",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/4a/1a/2e/museo-de-antioquia.jpg",
      ],
      "name": "Museo de Antioquia",
      "promPrice": 18000,
      "stars": 4.4,
      "description":
          "Art museum showcasing works by Botero and Colombian artists",
      "location": "Medellín City Center",
      "isFree": false,
      "openingHours": "Mon-Sat 10AM-5:30PM, Sun 10AM-4:30PM",
      "category": "Museum",
    },
    {
      "id": "5",
      "principalImageUrl":
          "https://img.atlasobscura.com/O6L8FP6tVPapgChafN6C_rLZ1roRKSW4zs1OWPVlu3o/rt:fit/h:400/q:81/sm:1/scp:1/ar:1/aHR0cHM6Ly9hdGxh/cy1kZXYuczMuYW1h/em9uYXdzLmNvbS91/cGxvYWRzL3BsYWNl/X2ltYWdlcy84Yjgx/YWI0OS1iNTVlLTQ4/N2ItYmEyMS0xNDBk/OWYxYWM0YWZmNTI0/NDA3NzM5Nzc4ZmU4/NjFfUGFycXVlLWRl/LWxhcy1MdWNlcy1N/ZWRlbGxpbi03Lmpw/Zw.webp",
      "secondaryImagesUrls": [
        "https://upload.wikimedia.org/wikipedia/commons/d/d5/Parque_de_las_Luces%2C_Medell%C3%ADn%2C_Colombia.jpg",
        "https://media-cdn.tripadvisor.com/media/photo-s/05/3f/f2/8f/parque-de-las-luces.jpg",
        "https://www.colombia.co/wp-content/uploads/2017/03/parque-de-las-luces.jpg",
      ],
      "name": "Parque de las Luces",
      "promPrice": 0,
      "stars": 4.0,
      "description": "Urban park featuring 300 illuminated pillars",
      "location": "Medellín City Center",
      "isFree": true,
      "openingHours": "24/7",
      "category": "Urban",
    },
    {
      "id": "6",
      "principalImageUrl":
          "https://estaticos.elcolombiano.com/binrepository/848x565/34c0/780d565/none/11101/JTTC/gcomuna-13-graffitour-74-jpg_42284849_20230501220002.jpg",
      "secondaryImagesUrls": [
        "https://upload.wikimedia.org/wikipedia/commons/9/9f/Comuna_13_-_Medell%C3%ADn.jpg",
        "https://media-cdn.tripadvisor.com/media/photo-s/18/30/9b/1b/comuna-13.jpg",
        "https://www.colombia.co/wp-content/uploads/2017/03/comuna-13.jpg",
      ],
      "name": "Comuna 13",
      "promPrice": 20000,
      "stars": 4.9,
      "description":
          "Transformed neighborhood famous for street art and escalators",
      "location": "San Javier",
      "isFree": false,
      "openingHours": "Daylight hours recommended",
      "category": "Cultural",
    },
    {
      "id": "7",
      "principalImageUrl":
          "https://soyrustiko.com/cdn/shop/articles/parque-de-los-pies-descalzos-318810.jpg?v=1666654620&width=800",
      "secondaryImagesUrls": [
        "https://upload.wikimedia.org/wikipedia/commons/5/5b/Parque_de_los_Pies_Descalzos_-_Medell%C3%ADn.jpg",
        "https://media-cdn.tripadvisor.com/media/photo-s/05/3f/f2/90/parque-de-los-pies-descalzos.jpg",
        "https://www.colombia.co/wp-content/uploads/2017/03/parque-de-los-pies-descalzos.jpg",
      ],
      "name": "Parque de los Pies Descalzos",
      "promPrice": 0,
      "stars": 4.1,
      "description": "Sensory park designed to be experienced barefoot",
      "location": "El Poblado",
      "isFree": true,
      "openingHours": "7AM-11PM Daily",
      "category": "Relaxation",
    },
  ];

  @override
  Future<List<Place>> fetchPlaces() async {
    List<Map<String, dynamic>> placesRaw = PlaceOnlineDatasource._mockPlaces;
    return placesRaw.map((place) => Place.fromJson(place)).toList();
  }

  @override
  Future<Place?> fetchProductById(String id) async {
    List<Map<String, dynamic>> placesRaw = PlaceOnlineDatasource._mockPlaces;
    Map<String, dynamic>? placeRaw = placesRaw
        .cast<Map<String, dynamic>?>()
        .firstWhere((place) => place?["id"] == id, orElse: () => null);

    return placeRaw != null ? Place.fromJson(placeRaw) : null;
  }
}
