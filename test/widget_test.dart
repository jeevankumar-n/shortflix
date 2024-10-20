import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_review_app/main.dart';
import 'package:movie_review_app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen displays reviews', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MovieReviewApp());

    // Check that the initial screen is displaying reviews.
    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('Reviewed by: John Doe'), findsOneWidget);

    // Check for other review items (this example assumes two reviews).
    expect(find.text('Interstellar'), findsOneWidget);
    expect(find.text('Reviewed by: Jane Smith'), findsOneWidget);
  });
}
