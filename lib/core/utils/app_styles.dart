import 'package:flutter/widgets.dart';

abstract class AppStyles {
  static TextStyle textSemiBold13(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 13),
    fontWeight: FontWeight.w600,
  );

  static TextStyle textSemiBold16(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 16),
    fontWeight: FontWeight.w600,
  );

  static TextStyle textSemiBold11(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 11),
    fontWeight: FontWeight.w600,
  );

  static TextStyle textBold23(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 23),
    fontWeight: FontWeight.w700,
  );

  static TextStyle textRegular11(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 11),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textRegular13(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 13),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textRegular16(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 16),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textBold16(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 16),
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold13(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 13),
    fontWeight: FontWeight.w700,
  );

  static TextStyle textBold19(context) => TextStyle(
    fontSize: getResponsiveSize(context, size: 19),
    fontWeight: FontWeight.w700,
  );


}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

double getResponsiveSize(BuildContext context, {required double size}) {
  double scaleFactor = getScaleFactor(context);
  double fontSize = size * scaleFactor;
  double lowerLimit = size * 0.8;
  double upperLimit = size * 1.2;
  return fontSize.clamp(lowerLimit, upperLimit);
}
