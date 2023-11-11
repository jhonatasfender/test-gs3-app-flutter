import 'package:app_flutter/utils/styles.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final List<Color> gradientColors;
  final String imagePath;
  final String points;
  final String cardName;
  final String availableLimit;
  final String bestPurchaseDay;

  const CardItem({
    Key? key,
    required this.gradientColors,
    required this.imagePath,
    required this.points,
    required this.cardName,
    required this.availableLimit,
    required this.bestPurchaseDay,
  }) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  bool isLimitVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildGradientDecoration(),
      width: 301,
      height: 140,
      constraints: const BoxConstraints(
        minWidth: 301.0,
        minHeight: 140.0,
      ),
      margin: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTopRow(),
          _buildDivider(),
          _buildBottomRow(),
        ],
      ),
    );
  }

  BoxDecoration _buildGradientDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: widget.gradientColors,
      ),
    );
  }

  Widget _buildTopRow() {
    return Container(
      padding: const EdgeInsets.all(13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(),
          _buildPointsAndCardName(),
          GestureDetector(
            onTap: () {
              setState(() {
                isLimitVisible = !isLimitVisible;
              });
            },
            child: const Icon(
              Icons.remove_red_eye,
              size: 24.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1.0,
      width: double.infinity,
      color: widget.gradientColors.first,
    );
  }

  Widget _buildBottomRow() {
    return isLimitVisible
        ? _buildColumn('Limite disponível', widget.availableLimit)
        : _buildPointsRow();
  }

  Widget _buildColumn(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.buildTextStyle(8, FontWeight.normal),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: AppStyles.cardSubtitleStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 88.0,
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Image.asset(
        widget.imagePath,
        width: 88.0,
        height: 56.0,
      ),
    );
  }

  Widget _buildPointsAndCardName() {
    return SizedBox(
      width: 100.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildPointsRow(),
          const SizedBox(height: 6.0),
          Text(
            widget.cardName,
            style: AppStyles.cardTitleStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildPointsRow({int numberPoints = 4}) {
    return Row(
      children: [
        for (int i = 0; i < numberPoints; i++)
          Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.only(right: 6.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        const SizedBox(width: 6.0),
        Text(widget.points, style: AppStyles.cardTitleStyle),
      ],
    );
  }
}
