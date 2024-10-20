import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart'; // Add mockito import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_review_app/main.dart';
import 'package:movie_review_app/screens/home_screen.dart';
import 'package:movie_review_app/screens/login_screen.dart';

// Mocks using mockito
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    mockUserCredential = MockUserCredential();
  });

  testWidgets('Shows HomeScreen if user is authenticated',
      (WidgetTester tester) async {
    // Simulate an authenticated user
    when(mockFirebaseAuth.signInWithEmailAndPassword(
      email: anyNamed('email') ?? 'default@example.com',
      password: anyNamed('password') ?? 'defaultPassword',
    )).thenAnswer((_) async => mockUserCredential);

    when(mockUserCredential.user).thenReturn(mockUser);
    when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
    when(mockUser.email).thenReturn('mockuser@example.com');

    await tester.pumpWidget(
      MaterialApp(
        home:
            mockFirebaseAuth.currentUser != null ? HomeScreen() : LoginScreen(),
      ),
    );

    // Verify that HomeScreen is shown
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Inception'), findsOneWidget);
  });

  testWidgets('Shows LoginScreen if user is not authenticated',
      (WidgetTester tester) async {
    // Simulate no authenticated user
    when(mockFirebaseAuth.currentUser).thenReturn(null);

    await tester.pumpWidget(
      MaterialApp(
        home:
            mockFirebaseAuth.currentUser != null ? HomeScreen() : LoginScreen(),
      ),
    );

    // Verify that LoginScreen is shown
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
