import 'package:app_flutter/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Text style properties are correct', () {
    TextStyle textStyle = AppStyles.buildTextStyle(
      20.0,
      FontWeight.bold,
      color: Colors.blue,
    );
    expect(textStyle.fontFamily, 'Mulish');
    expect(textStyle.fontSize, 20.0);
    expect(textStyle.fontWeight, FontWeight.bold);
    expect(textStyle.color, Colors.blue);

    expect(AppStyles.cardTitleStyle.fontFamily, 'Mulish');
    expect(AppStyles.cardTitleStyle.fontSize, 14.0);
    expect(AppStyles.cardTitleStyle.color, Colors.white);

    expect(AppStyles.cardSubtitleStyle.fontFamily, 'Mulish');
    expect(AppStyles.cardSubtitleStyle.fontSize, 16.0);
    expect(AppStyles.cardSubtitleStyle.fontWeight, FontWeight.bold);
    expect(AppStyles.cardSubtitleStyle.color, Colors.white);

    expect(AppStyles.lastReleasesTitleStyle.color, const Color(0xFF1a1a1a));
    expect(AppStyles.lastReleasesTitleStyle.fontFamily, 'Mulish');
    expect(AppStyles.lastReleasesTitleStyle.fontSize, 18.0);
    expect(AppStyles.lastReleasesTitleStyle.fontWeight, FontWeight.bold);

    expect(AppStyles.lastReleasesDateStyle.color, const Color(0xFF2890cf));
    expect(AppStyles.lastReleasesDateStyle.fontFamily, 'Mulish');
    expect(AppStyles.lastReleasesDateStyle.fontSize, 16.0);
    expect(AppStyles.lastReleasesDateStyle.fontWeight, FontWeight.bold);

    expect(AppStyles.lastReleasesAmountStyle.color, const Color(0xFF212121));
    expect(AppStyles.lastReleasesAmountStyle.fontFamily, 'Mulish');
    expect(AppStyles.lastReleasesAmountStyle.fontSize, 16.0);
    expect(AppStyles.lastReleasesAmountStyle.fontWeight, FontWeight.bold);

    expect(
      AppStyles.lastReleasesAmountDetailsStyle.color,
      const Color(0xFF828285),
    );
    expect(AppStyles.lastReleasesAmountDetailsStyle.fontFamily, 'Mulish');
    expect(AppStyles.lastReleasesAmountDetailsStyle.fontSize, 12.0);
    expect(
      AppStyles.lastReleasesAmountDetailsStyle.fontWeight,
      FontWeight.bold,
    );
  });
}
