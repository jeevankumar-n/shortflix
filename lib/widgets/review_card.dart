import 'package:flutter/material.dart';
import '../models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              review.movieName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text('Reviewed by: ${review.reviewer}'),
            SizedBox(height: 8),
            Text(review.reviewText),
            SizedBox(height: 8),
            Row(
              children: List.generate(review.rating,
                  (index) => Icon(Icons.star, color: Colors.amber)),
            ),
          ],
        ),
      ),
    );
  }
}
