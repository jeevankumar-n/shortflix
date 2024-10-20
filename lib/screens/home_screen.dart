import 'package:flutter/material.dart';
import '../models/review_model.dart';
import '../widgets/review_card.dart';

class HomeScreen extends StatelessWidget {
  final List<Review> reviews = [
    Review(
      movieName: 'Inception',
      reviewer: 'John Doe',
      reviewText: 'A mind-bending thriller with stunning visuals.',
      rating: 5,
    ),
    Review(
      movieName: 'Interstellar',
      reviewer: 'Jane Smith',
      reviewText: 'A visually stunning journey through space and time.',
      rating: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Reviews'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewCard(review: reviews[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for adding a new review
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
