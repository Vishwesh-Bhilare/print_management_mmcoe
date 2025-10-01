import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_printing_system/main.dart';

void main() {
  testWidgets('App launches without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app starts without crashing
    expect(find.byType(MaterialApp), findsOneWidget);

    // Check for app name text that should be visible
    expect(find.text('Student Print System'), findsOneWidget);
    expect(find.text('University Name'), findsOneWidget);

    // Check for login form elements
    expect(find.text('Student ID'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('Login form validation works', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Try to tap login without entering data
    await tester.tap(find.text('LOGIN'));
    await tester.pump();

    // Should still be on login screen (form validation prevents navigation)
    expect(find.text('Student Print System'), findsOneWidget);
  });

  testWidgets('Toggle between login and signup', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Initially should see login button
    expect(find.text('LOGIN'), findsOneWidget);

    // Tap to switch to signup
    await tester.tap(find.text('Don\'t have an account? Sign up'));
    await tester.pump();

    // Now should see signup button and additional fields
    expect(find.text('SIGN UP'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
  });
}