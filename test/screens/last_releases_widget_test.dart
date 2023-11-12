import 'package:app_flutter/screens/last_releases_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LastReleasesWidget Tests', () {
    testWidgets('Renders LastReleasesWidget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LastReleasesWidget())),
      );

      expect(find.byType(LastReleasesWidget), findsOneWidget);
    });

    testWidgets('Renders Release History Item', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: LastReleasesHistoryItem())),
      );

      expect(find.byType(LastReleasesHistoryItem), findsOneWidget);
    });
  });
}
