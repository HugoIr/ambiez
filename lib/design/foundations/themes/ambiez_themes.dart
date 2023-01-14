import 'package:ambiez/design/foundations/colors.dart';
import 'package:ambiez/design/foundations/typo.dart';
import 'package:flutter/material.dart';

final ligthThemeAmbiez = ThemeData(
    primaryColor: AmbiezColorsFoundation.primaryColor,
    primarySwatch: AmbiezColorsFoundation.primaryColorMat,
    backgroundColor: AmbiezColorsFoundation.bgGray,
    fontFamily: AmbiezTypographyFoundation.familyBody,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w700,
        fontSize: AmbiezTypographyFoundation.fontSizeH1,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
      headline2: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w900,
        fontSize: AmbiezTypographyFoundation.fontSizeH2,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
      headline3: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH3,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
      headline4: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH4,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
      headline5: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH5,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
      headline6: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH6,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
    ));

final darkThemeAmbiez = ThemeData(
    primaryColor: AmbiezColorsFoundation.primaryColor,
    primarySwatch: AmbiezColorsFoundation.primaryColorMat,
    backgroundColor: AmbiezColorsFoundation.bgDark,
    fontFamily: AmbiezTypographyFoundation.familyBody,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w700,
        fontSize: AmbiezTypographyFoundation.fontSizeH1,
        color: AmbiezColorsFoundation.ligthTextColors,
      ),
      headline2: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w900,
        fontSize: AmbiezTypographyFoundation.fontSizeH2,
        color: AmbiezColorsFoundation.ligthTextColors,
      ),
      headline3: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH3,
        color: AmbiezColorsFoundation.ligthTextColors,
      ),
      headline4: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH4,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
      headline5: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH5,
        color: AmbiezColorsFoundation.darkTextColors,
      ),
      headline6: TextStyle(
        fontFamily: AmbiezTypographyFoundation.familyHeading,
        fontWeight: FontWeight.w400,
        fontSize: AmbiezTypographyFoundation.fontSizeH6,
        color: AmbiezColorsFoundation.ligthTextColors,
      ),
    ));
