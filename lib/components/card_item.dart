import 'package:app_flutter/utils/styles.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatefulWidget {
  final List<Color> gradientColors;
  final String imagePath;
  final String points;
  final String cardName;
  final String availableLimit;
  final String bestPurchaseDay;

  const CreditCard({
    Key? key,
    required this.gradientColors,
    required this.imagePath,
    required this.points,
    required this.cardName,
    required this.availableLimit,
    required this.bestPurchaseDay,
  }) : super(key: key);

  @override
  CreditCardState createState() => CreditCardState();
}

class CreditCardState extends State<CreditCard> {
  bool isLimitVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildGradientDecoration(),
      width: 301,
      height: 140,
      constraints: const BoxConstraints(minWidth: 301.0, minHeight: 140.0),
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
          _buildCardLogo(),
          _buildPointsAndCardName(),
          _buildVisibilityToggle(),
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
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _buildLimitContainer()),
          Expanded(child: _buildPurchaseDayContainer()),
        ],
      ),
    );
  }

  Widget _buildCardLogo() {
    return Container(
      width: 88.0,
      height: 56.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Image.asset(widget.imagePath, width: 88.0, height: 56.0),
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
          Text(widget.cardName, style: _cardTitleTextStyle()),
        ],
      ),
    );
  }

  Widget _buildVisibilityToggle() {
    return GestureDetector(
      onTap: _toggleLimitVisibility,
      child: const Icon(Icons.remove_red_eye, size: 24.0, color: Colors.white),
    );
  }

  Widget _buildLimitContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Limite disponível', style: _smallTextStyle()),
          const SizedBox(height: 2.0),
          isLimitVisible
              ? Text(widget.availableLimit, style: _cardSubtitleTextStyle())
              : Flexible(child: _buildHiddenLimitContainer()),
        ],
      ),
    );
  }

  Widget _buildHiddenLimitContainer() {
    return Container(
      alignment: Alignment.center,
      height: 20,
      child: Row(
        children: _buildPlaceholders(numberOfPlaceholders: 6),
      ),
    );
  }

  Widget _buildPurchaseDayContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Melhor dia de compra', style: _smallTextStyle()),
          Text(widget.bestPurchaseDay, style: _cardSubtitleTextStyle()),
        ],
      ),
    );
  }

  Widget _buildPointsRow() {
    return Row(
      children: [
        ..._buildPlaceholders(),
        const SizedBox(width: 6.0),
        Expanded(child: Text(widget.points, style: _cardTitleTextStyle())),
      ],
    );
  }

  List<Widget> _buildPlaceholders({int numberOfPlaceholders = 4}) {
    return List.generate(
      numberOfPlaceholders,
      (index) => Container(
        width: 8.0,
        height: 8.0,
        margin: const EdgeInsets.only(right: 6.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  void _toggleLimitVisibility() {
    setState(() {
      isLimitVisible = !isLimitVisible;
    });
  }

  TextStyle _smallTextStyle() {
    return AppStyles.buildTextStyle(8, FontWeight.normal);
  }

  TextStyle _cardTitleTextStyle() {
    return AppStyles.cardTitleStyle;
  }

  TextStyle _cardSubtitleTextStyle() {
    return AppStyles.cardSubtitleStyle;
  }
}
