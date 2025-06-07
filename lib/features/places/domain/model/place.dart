class Place {
  String id;
  String principalImageUrl;
  List<String> secondaryImagesUrls;
  String name;
  num promPrice;
  num stars;

  Place({
    required this.id,
    required this.principalImageUrl,
    required this.secondaryImagesUrls,
    required this.promPrice,
    required this.stars,
    required this.name,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    if (json["id"] ||
        json["principalImageUrl"] == null ||
        json["secondaryImagesUrls"] == null ||
        json["stars"] == null ||
        json["name"] == null) {
      throw FormatException(
        'Missing required fields. Required params: id,principalImageUrl, secondaryImagesUrls, promPrice, stars, name',
      );
    }
    return Place(
      id: json["id"],
      principalImageUrl: json["principalImageUrl"],
      secondaryImagesUrls: json["secondaryImagesUrls"],
      promPrice: json["promPrice"],
      stars: json["stars"],
      name: json["name"],
    );
  }
}
