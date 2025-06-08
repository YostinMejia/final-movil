class Comment {
  final String userName;
  final String opinion;
  final num stars;

  Comment({
    required this.opinion,
    required this.stars,
    required this.userName,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userName: json['userName'],
      opinion: json['opinion'],
      stars: json['stars'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'opinion': opinion,
      'stars': stars,
    };
  }
}
