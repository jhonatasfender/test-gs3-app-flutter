import 'package:app_flutter/components/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
  });

  testWidgets('CreditCard widget should render', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CreditCard(
            gradientColors: [Colors.blue, Colors.green],
            imagePath: 'assets/images/card-03.png',
            points: '1000',
            cardName: 'My Card',
            availableLimit: '\$10,000',
            bestPurchaseDay: 'Monday',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(CreditCard), findsOneWidget);
    expect(find.text('My Card'), findsOneWidget);
    expect(find.text('\$10,000'), findsOneWidget);
    expect(find.text('Monday'), findsOneWidget);
  });

  testWidgets(
    'CreditCard should toggle limit visibility on tap',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CreditCard(
              gradientColors: [Colors.blue, Colors.green],
              imagePath: 'assets/images/card-03.png',
              points: '1000',
              cardName: 'My Card',
              availableLimit: '\$10,000',
              bestPurchaseDay: 'Monday',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('\$10,000'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.remove_red_eye));
      await tester.pumpAndSettle();

      expect(find.text('\$10,000'), findsNothing);

      await tester.tap(find.byIcon(Icons.remove_red_eye));
      await tester.pumpAndSettle();

      expect(find.text('\$10,000'), findsOneWidget);
    },
  );
}
