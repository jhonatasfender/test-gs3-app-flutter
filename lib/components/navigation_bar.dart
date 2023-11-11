import 'dart:ffi';

import 'package:app_flutter/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 90,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 1,
            spreadRadius: 0,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavBarItem(iconPath: 'assets/icons/home.svg', label: 'Home'),
          NavBarItem(iconPath: 'assets/icons/invoice.svg', label: 'Fatura'),
          NavBarItem(iconPath: 'assets/icons/card.svg', label: 'Cartão'),
          NavBarItem(iconPath: 'assets/icons/shop.svg', label: 'Shop'),
        ],
      ),
    );
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
