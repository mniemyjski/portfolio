import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app/portfolio_app.dart';

void main() {
  testWidgets('Portfolio renders hero section', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump(const Duration(milliseconds: 900));

    expect(find.text('Marcel Niemyjski'), findsWidgets);
    expect(find.text('Oracle SQL'), findsOneWidget);
    expect(find.text('Supabase'), findsOneWidget);
  });
}
