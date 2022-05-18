import 'package:flutter/material.dart';
import 'package:core/core.dart';

final ThemeData lightTheme = new ThemeData(
    fontFamily: AssetsCollection.fRoboto,
    brightness: Brightness.light,
    bottomAppBarColor: Colors.white,
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: ColorsCollection.cRipple10),
    backgroundColor: Color(0xFFF5F6FA), //Colors.white,
    canvasColor: Colors.white,
    hintColor: Color(0xFF777777),
    buttonColor: ColorsCollection.cRipple10,
    disabledColor: ColorsCollection.cDarkGrey,
    scrollbarTheme: ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(ColorsCollection.cDarkBg)),
    buttonTheme: ButtonThemeData(
        height: 45.h,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        buttonColor: ColorsCollection.cRipple10,
        disabledColor: ColorsCollection.cDisableColor),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        headline1: headline2(),
        headline2: headline3(),
        headline3: headline4(),
        headline4: headline6(),
        headline5: headline5(),
        headline6: subtitle1(),
        subtitle1: subtitle2(),
        subtitle2: subtitle3(),
        bodyText1: body2(),
        bodyText2: body3()),
    primaryColor: ColorsCollection.cRipple10,
    accentColor: ColorsCollection.cRipple10,
    accentColorBrightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity);

Color _getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.selected,
    MaterialState.hovered,
    MaterialState.focused
  };
  if (states.any(interactiveStates.contains)) {
    return ColorsCollection.cRipple10;
  } else {
    return ColorsCollection.cLightGrey;
  }
}

final ThemeData darkTheme = new ThemeData(
    fontFamily: AssetsCollection.fRoboto,
    brightness: Brightness.dark,
    bottomAppBarColor: ColorsCollection.cDarkBg,
    textSelectionTheme:
        TextSelectionThemeData(cursorColor: ColorsCollection.cRipple10),
    backgroundColor: ColorsCollection.cDarkBg,
    buttonColor: ColorsCollection.cRipple10,
    disabledColor: ColorsCollection.cGreyCDColor,
    canvasColor: ColorsCollection.cDarkBg,
    scrollbarTheme: ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(ColorsCollection.cBgColor)),
    radioTheme:
        RadioThemeData(fillColor: MaterialStateProperty.resolveWith(_getColor)),
    checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith(_getColor)),
    buttonTheme: ButtonThemeData(
        height: 45,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        buttonColor: ColorsCollection.cRipple10,
        disabledColor: ColorsCollection.cDisableColor),
    scaffoldBackgroundColor: ColorsCollection.cDarkBg,
    textTheme: TextTheme(
        headline1: headline2(),
        headline2: headline3(),
        headline3: headline4(),
        headline4: headline6(),
        headline5: headline5(),
        headline6: subtitle1(),
        subtitle1: subtitle2(),
        subtitle2: subtitle3(),
        bodyText1: body2(),
        bodyText2: body3()),
    primaryColor: ColorsCollection.cRipple10,
    accentColor: ColorsCollection.cRipple10,
    accentColorBrightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity);
