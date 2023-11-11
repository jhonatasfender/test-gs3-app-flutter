import 'package:app_flutter/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFavoritesWidget extends StatelessWidget {
  const MyFavoritesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Meus favoritos',
                style: AppStyles.lastReleasesTitleStyle,
              ),
              Row(
                children: [
                  const Text(
                    'Personalizar',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      fontFamily: 'Mulish',
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  SvgPicture.asset(
                    'assets/icons/grid.svg',
                    width: 18.0,
                    height: 18.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MyFavoritesOptionItem(
                  icon: 'assets/icons/virtual-card.svg',
                  title: 'Cartão virtual',
                ),
                MyFavoritesOptionItem(
                  icon: 'assets/icons/additional-card.svg',
                  title: 'Cartão adicional',
                ),
                MyFavoritesOptionItem(
                  icon: 'assets/icons/shield.svg',
                  title: 'Seguros',
                ),
                MyFavoritesOptionItem(
                  icon: 'assets/icons/mail.svg',
                  title: 'Pacotes',
                ),
                MyFavoritesOptionItem(
                  icon: 'assets/icons/mail.svg',
                  title: 'Pacotes',
                ),
                MyFavoritesOptionItem(
                  icon: 'assets/icons/mail.svg',
                  title: 'Pacotes',
                ),
                MyFavoritesOptionItem(
                  icon: 'assets/icons/mail.svg',
                  title: 'Pacotes',
                ),
                MyFavoritesOptionItem(
                  icon: 'assets/icons/mail.svg',
                  title: 'Pacotes',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyFavoritesOptionItem extends StatelessWidget {
  final String icon;
  final String title;

  const MyFavoritesOptionItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24.0),
      child: Column(
        children: [
          Container(
            width: 66.0,
            height: 66.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: const Color.fromRGBO(229, 229, 229, 0.2),
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                width: 30.0,
                height: 30.0,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            title,
            style: AppStyles.buildTextStyle(
              14,
              FontWeight.normal,
              color: const Color(0xFF1a1a1a),
            ),
          ),
        ],
      ),
    );
  }
}
