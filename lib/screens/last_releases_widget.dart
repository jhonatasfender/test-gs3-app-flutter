import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_flutter/utils/styles.dart';

class LastReleasesWidget extends StatelessWidget {
  const LastReleasesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: [
          _buildHeader(),
          const SizedBox(height: 16.0),
          _buildReleaseHistory(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Últimos lançamentos', style: AppStyles.lastReleasesTitleStyle),
          Row(
            children: [
              const Text(
                'Ver todos',
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  fontFamily: 'Mulish',
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5.0),
              SvgPicture.asset(
                'assets/icons/arrow.svg',
                width: 12.0,
                height: 12.0,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReleaseHistory() {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        for (int i = 0; i < 3; i++) ...[
          _buildReleaseDate(),
          for (int i = 0; i < 3; i++) ...[
            const LastReleasesHistoryItem(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: _buildDivider(),
            ),
          ],
        ],
      ],
    );
  }

  Widget _buildReleaseDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hoje, 05 Set', style: AppStyles.lastReleasesDateStyle),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1.0,
      color: const Color.fromRGBO(229, 229, 229, 0.7),
    );
  }
}

class LastReleasesHistoryItem extends StatelessWidget {
  const LastReleasesHistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHistoryIcon(),
        const SizedBox(width: 12.0),
        Expanded(child: _buildHistoryDetails()),
        _buildHistoryAmount(),
      ],
    );
  }

  Widget _buildHistoryIcon() {
    return Container(
      width: 45.0,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: const Color.fromRGBO(229, 229, 229, 0.2),
      ),
      child: Center(
        child: SvgPicture.asset(
          'assets/icons/sr-cart-trolley-v2.svg',
          width: 24.0,
          height: 24.0,
        ),
      ),
    );
  }

  Widget _buildHistoryDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Apple',
          style: AppStyles.lastReleasesAmountStyle,
        ),
        const SizedBox(height: 4.0),
        const Text(
          '05/09 às 22:35',
          style: TextStyle(
            color: Color(0xFF69696b),
            fontFamily: 'Mulish',
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('R\$545,99', style: AppStyles.lastReleasesAmountStyle),
        const SizedBox(height: 4.0),
        Text('em 12x', style: AppStyles.lastReleasesAmountDetailsStyle),
      ],
    );
  }
}
