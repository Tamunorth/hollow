import 'package:flutter/material.dart';
import 'package:hollow_bit/app/constants/color_constants.dart';
import 'package:hollow_bit/app/constants/text_constants.dart';

class TextStylesConstants {
  ///Default font is Rubik, so whenever the font family is not defined Rubik is used

  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    fontFamily: TextConstants.karlaFont,
    height: 1.17,
    color: ColorConstants.grey900,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontFamily: TextConstants.karlaFont,
    height: 1.17,
    color: ColorConstants.grey900,
  );

  static const TextStyle subHeading1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: ColorConstants.grey700,
  );
  static const TextStyle noTransText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: ColorConstants.grey003,
  );
  static const TextStyle subHeadingItalic = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: ColorConstants.grey700,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle textFieldHint = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorConstants.grey600,
  );

  static const TextStyle textFieldLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.71,
    color: ColorConstants.grey600,
  );
  static const TextStyle dropDownLabel1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: ColorConstants.grey900,
  );
  static const TextStyle actionCardlabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.2,
    color: ColorConstants.grey800,
  );

  static const TextStyle subScriptText1 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: Colors.black,
  );
  static const TextStyle seeAllText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: ColorConstants.primary600,
  );

  static const TextStyle subScriptText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: ColorConstants.success500,
  );
  static const TextStyle infoText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.6,
    color: ColorConstants.secondaryAccColor,
  );
  static const TextStyle bottomSheetHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.1,
    fontFamily: TextConstants.karlaFont,
    color: ColorConstants.success500,
  );

  static const TextStyle textButtonStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.3,
    color: Colors.white,
  );
  static const TextStyle debitText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: ColorConstants.error500,
  );
  static const TextStyle creditText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: ColorConstants.success500,
  );
}
