import 'package:app_flutter/screens/my_favorites_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'MyFavoritesWidget renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MyFavoritesWidget()));

      expect(find.text('Meus favoritos'), findsOneWidget);

      expect(find.text('Personalizar'), findsOneWidget);

      expect(find.byType(MyFavoritesOptionItem), findsWidgets);
    },
  );

  testWidgets(
    'MyFavoritesOptionItem renders correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: MyFavoritesOptionItem(
          icon: 'assets/icons/virtual-card.svg',
          title: 'Cartão virtual',
        ),
      ));

      expect(find.byType(SvgPicture), findsOneWidget);

      expect(find.text('Cartão virtual'), findsOneWidget);
    },
  );
}
