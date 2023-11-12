import 'dart:io' show Platform;
import 'package:app_flutter/utils/styles.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIOS = Platform.isIOS;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 100,
      width: double.infinity,
      decoration: buildContainerDecoration(isIOS),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(
            iconPath: 'assets/icons/home.svg',
            label: 'Home',
            active: true,
          ),
          NavBarItem(iconPath: 'assets/icons/invoice.svg', label: 'Fatura'),
          NavBarItem(iconPath: 'assets/icons/card.svg', label: 'Cartão'),
          NavBarItem(iconPath: 'assets/icons/shop.svg', label: 'Shop'),
        ],
      ),
    );
  }

  BoxDecoration buildContainerDecoration(bool isIOS) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
      ),
      boxShadow: isIOS ? buildIOSBoxShadow() : buildAndroidBoxShadow(),
    );
  }

  List<BoxShadow> buildIOSBoxShadow() {
    return [
      const BoxShadow(
        color: Colors.black,
        blurRadius: 9,
        spreadRadius: 3,
        offset: Offset(0, 3),
        inset: true,
      ),
      const BoxShadow(
        color: Colors.white,
        blurRadius: 10,
        spreadRadius: 2,
        inset: true,
      ),
    ];
  }

  List<BoxShadow> buildAndroidBoxShadow() {
    return [
      const BoxShadow(
        color: Colors.black,
        blurRadius: 9,
        spreadRadius: 0,
        inset: true,
      ),
      const BoxShadow(
        color: Colors.white,
        blurRadius: 10,
        spreadRadius: 7,
        inset: true,
      ),
    ];
  }
}

class NavBarItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool active;

  const NavBarItem({
    Key? key,
    required this.iconPath,
    required this.label,
    this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color iconColor =
        active ? const Color(0xFF3C6AB2) : const Color(0xFFB4B4B8);
    Color textColor =
        active ? const Color(0xFF2890CF) : const Color(0xFFB4B4B8);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          width: 35,
          height: 35,
          theme: SvgTheme(currentColor: iconColor),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: AppStyles.buildTextStyle(
            12,
            FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
