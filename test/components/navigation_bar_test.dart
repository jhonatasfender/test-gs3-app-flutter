import 'package:app_flutter/components/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomNavigationBar', () {
    testWidgets(
      'Renders CustomNavigationBar with NavBarItem widgets',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: CustomNavigationBar()),
        );

        expect(find.byType(CustomNavigationBar), findsOneWidget);
        expect(find.byType(NavBarItem), findsNWidgets(4));
      },
    );

    testWidgets(
      'CustomNavigationBar has correct structure',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: CustomNavigationBar()),
        );

        expect(
          find.descendant(
            of: find.byType(CustomNavigationBar),
            matching: find.byType(Container),
          ),
          findsOneWidget,
        );
        expect(
          find.descendant(
            of: find.byType(CustomNavigationBar),
            matching: find.byType(Row),
          ),
          findsOneWidget,
        );
      },
    );
  });

  group('NavBarItem', () {
    testWidgets(
      'Renders NavBarItem with correct icon and label',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: CustomNavigationBar()),
        );

        final navBarItemFinder = find.byType(NavBarItem).first;
        final navBarItem = tester.widget<NavBarItem>(navBarItemFinder);

        expect(navBarItem.iconPath, 'assets/icons/home.svg');
        expect(navBarItem.label, 'Home');
        expect(navBarItem.active, true);
      },
    );

    testWidgets(
      'Renders NavBarItem with inactive state',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          const MaterialApp(home: CustomNavigationBar()),
        );

        final navBarItemFinder = find.byType(NavBarItem).at(1);
        final navBarItem = tester.widget<NavBarItem>(navBarItemFinder);

        expect(navBarItem.active, false);
      },
    );
  });

  group('ContainerDecoration', () {
    test('Builds BoxDecoration for iOS', () {
      CustomNavigationBar customNavigationBar = const CustomNavigationBar();
      final containerDecoration = customNavigationBar.buildContainerDecoration(
        true,
      );

      expect(containerDecoration.color, equals(Colors.white));
      expect(
        containerDecoration.borderRadius,
        equals(const BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        )),
      );

      final boxShadows = containerDecoration.boxShadow;
      expect(boxShadows, isA<List<BoxShadow>>());
    });

    test('Builds BoxDecoration for Android', () {
      CustomNavigationBar customNavigationBar = const CustomNavigationBar();
      final containerDecoration = customNavigationBar.buildContainerDecoration(
        false,
      );

      expect(containerDecoration.color, equals(Colors.white));
      expect(
        containerDecoration.borderRadius,
        equals(const BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        )),
      );

      final boxShadows = containerDecoration.boxShadow;
      expect(boxShadows, isA<List<BoxShadow>>());
    });
  });

  test(
    'Private method _buildIOSBoxShadow returns a list of BoxShadow for iOS',
    () {
      CustomNavigationBar customNavigationBar = const CustomNavigationBar();
      final boxShadows = customNavigationBar.buildIOSBoxShadow();

      expect(boxShadows, isA<List<BoxShadow>>());
      expect(boxShadows.length, 2);
    },
  );

  test(
    'Private method _buildAndroidBoxShadow returns a list of BoxShadow for Android',
    () {
      CustomNavigationBar customNavigationBar = const CustomNavigationBar();
      final boxShadows = customNavigationBar.buildAndroidBoxShadow();

      expect(boxShadows, isA<List<BoxShadow>>());
      expect(boxShadows.length, 2);
    },
  );
}
