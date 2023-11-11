import 'package:app_flutter/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final int notificationCount;

  const CustomBadge({
    Key? key,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          'assets/icons/bell.svg',
          width: 22,
        ),
        if (notificationCount > 0)
          Positioned(
            right: -9,
            top: -10,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Center(
                child: Text(
                  notificationCount.toString(),
                  style: AppStyles.buildTextStyle(8, FontWeight.bold),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
