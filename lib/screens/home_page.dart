import 'dart:math' as math;
import 'package:app_flutter/components/badge.dart';
import 'package:app_flutter/components/card_item.dart';
import 'package:app_flutter/screens/last_releases_widget.dart';
import 'package:app_flutter/screens/my_favorites_widget.dart';
import 'package:app_flutter/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomePageBody(),
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        key: const Key('homePageContainer'),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(60, 106, 178, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            stops: [0, 0.4],
          ),
        ),
        child: Column(
          children: [
            buildTopHeader(context),
            buildCardSection(),
            buildDivider(),
            const MyFavoritesWidget(),
            const SizedBox(height: 15),
            buildDivider(),
            const LastReleasesWidget(),
          ],
        ),
      ),
    );
  }

  Widget buildTopHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: math.max(0, MediaQuery.of(context).padding.top - 5),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopRow(),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              height: 1,
              color: const Color(0xFFe5e5e5),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildHamburgerIcon(),
        Container(child: buildUserInfo()),
        buildNotificationBadge(),
      ],
    );
  }

  Widget buildHamburgerIcon() {
    return SvgPicture.asset(
      'assets/icons/hamburger.svg',
      width: 25,
    );
  }

  Widget buildUserInfo() {
    return Row(
      children: [
        Text('Olá, ', style: AppStyles.buildTextStyle(17.0, FontWeight.normal)),
        Text('Cliente', style: AppStyles.buildTextStyle(17.0, FontWeight.bold)),
      ],
    );
  }

  Widget buildNotificationBadge() {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/chat.svg',
          width: 30,
        ),
        const SizedBox(width: 8),
        const CustomBadge(notificationCount: 3),
      ],
    );
  }

  Widget buildCardSection() {
    return Container(
      margin: const EdgeInsets.all(17.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            buildCardItem(
              gradientColors: [
                const Color(0xFF2b66bc),
                const Color(0xFF132d55)
              ],
              imagePath: 'assets/images/card-01.png',
              points: '5621',
              cardName: 'BRB HCB',
              availableLimit: 'R\$ 7.867,80',
              bestPurchaseDay: '20',
            ),
            buildCardItem(
              gradientColors: [
                const Color(0xFF00494b),
                const Color(0xFF082321)
              ],
              imagePath: 'assets/images/card-02.png',
              points: '5621',
              cardName: 'BRB HCB',
              availableLimit: 'R\$ 7.867,80',
              bestPurchaseDay: '20',
            ),
            buildCardItem(
              gradientColors: [
                const Color(0xFFb1a7a6),
                const Color(0xFFba181b)
              ],
              imagePath: 'assets/images/card-03.png',
              points: '5621',
              cardName: 'BRB HCB',
              availableLimit: 'R\$ 7.867,80',
              bestPurchaseDay: '20',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardItem({
    required List<Color> gradientColors,
    required String imagePath,
    required String points,
    required String cardName,
    required String availableLimit,
    required String bestPurchaseDay,
  }) {
    return CreditCard(
      gradientColors: gradientColors,
      imagePath: imagePath,
      points: points,
      cardName: cardName,
      availableLimit: availableLimit,
      bestPurchaseDay: bestPurchaseDay,
    );
  }

  Widget buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      height: 1,
      color: const Color(0xffe5e5e5b2),
    );
  }
}
