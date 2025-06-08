import 'package:chiva_exp/features/places/domain/model/comment.dart';

class Place {
  String id;
  String principalImageUrl;
  List<String> secondaryImagesUrls;
  String name;
  num promPrice;
  num stars;
  String description;
  Map<String, dynamic> details;
  List<Comment> comments;

  Place({
    required this.id,
    required this.principalImageUrl,
    required this.secondaryImagesUrls,
    required this.promPrice,
    required this.stars,
    required this.name,
    required this.description,
    required this.details,
    required this.comments,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    if (json["id"] == null ||
        json["principalImageUrl"] == null ||
        json["secondaryImagesUrls"] == null ||
        json["stars"] == null ||
        json["name"] == null) {
      throw FormatException(
        'Missing required fields. Required params: id, principalImageUrl, secondaryImagesUrls, promPrice, stars, name',
      );
    }

    return Place(
      id: json["id"],
      principalImageUrl: json["principalImageUrl"],
      secondaryImagesUrls: List<String>.from(json["secondaryImagesUrls"]),
      promPrice: json["promPrice"],
      stars: json["stars"],
      name: json["name"],
      description: json["description"] ?? '',
      details: Map<String, dynamic>.from(json["details"] ?? {}),
      comments: (json["comments"] as List<dynamic>? ?? [])
          .map((comment) => Comment.fromJson(comment))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "principalImageUrl": principalImageUrl,
      "secondaryImagesUrls": secondaryImagesUrls,
      "promPrice": promPrice,
      "stars": stars,
      "name": name,
      "description": description,
      "details": details,
      "comments": comments.map((c) => c.toJson()).toList(),
    };
  }
}
