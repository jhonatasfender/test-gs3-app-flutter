import 'package:app_flutter/components/badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'CustomBadge widget displays bell icon',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomBadge(),
        ),
      );

      expect(find.byType(SvgPicture), findsOneWidget);
      expect(find.byKey(const Key('bellIcon')), findsOneWidget);
    },
  );

  testWidgets(
    'CustomBadge widget displays notification count when count > 0',
    (WidgetTester tester) async {
      const int notificationCount = 5;

      await tester.pumpWidget(
        const MaterialApp(
          home: CustomBadge(notificationCount: notificationCount),
        ),
      );

      expect(find.text(notificationCount.toString()), findsOneWidget);
    },
  );

  testWidgets(
    'CustomBadge widget does not display notification count when count is 0',
    (WidgetTester tester) async {
      const int notificationCount = 0;

      await tester.pumpWidget(
        const MaterialApp(
          home: CustomBadge(notificationCount: notificationCount),
        ),
      );

      expect(find.text(notificationCount.toString()), findsNothing);
    },
  );

  testWidgets(
    'CustomBadge widget layout and positioning',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CustomBadge(notificationCount: 3),
        ),
      );

      expect(find.byType(Positioned), findsOneWidget);
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);

      expect(
        tester.getTopLeft(find.byType(Container)),
        const Offset(789.0, -10.0),
      );
    },
  );
}
