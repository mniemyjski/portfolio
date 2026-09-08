import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders welcome message', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(),
      ),
    );

    expect(find.text('WITAJ NA MOIM PORTFOLIO 🔥'), findsOneWidget);
  });
}
