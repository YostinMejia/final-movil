import 'package:chiva_exp/features/places/domain/model/comment.dart' as model;
import 'package:flutter/material.dart';

class PlaceOpinions extends StatelessWidget {
  final List<model.Comment> comments;

  const PlaceOpinions({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return CommentCard(
          userName: comment.userName,
          opinion: comment.opinion,
          stars: comment.stars,
        );
      },
    );
  }
}

class CommentCard extends StatelessWidget {
  final String userName;
  final String opinion;
  final num stars;

  const CommentCard({
    super.key,
    required this.opinion,
    required this.stars,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                5,
                (i) => Icon(
                  Icons.star,
                  color: i < stars ? Colors.amber : Colors.grey,
                  size: 16,
                ),
              ),
            ),
            Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(opinion),
          ],
        ),
      ),
    );
  }
}
