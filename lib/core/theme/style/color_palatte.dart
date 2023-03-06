import 'package:flutter/material.dart';

class ColorPalette {
  final Color primary;
  final Color lightPrimary;
  final Color extraLightPrimary;
  final Color extraExtraLightPrimary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secoundry;
  final Color darkSecoundry;
  final Color onSecoundry;
  final Color secoundryContainer;
  final Color onSecoundryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color scaffoldBackground;
  final Color background;
  final Color darkBackground;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color border;
  final Color hint;
  final Color textPrimary;
  final Color textSecoundry;
  final Color disableColor;
  final Color silver = const Color(0xffF8EDFF);
  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color success = const Color(0xff1FA14F);
  final Color successContainer = const Color(0xffEFF9F3);
  final Color infoContainer = const Color(0xffF9F3E6);
  final Color extraDarkTextPrimary = const Color(0xff434343);
  final Color darkTextPrimary = const Color(0xff5B5B5B);
  final Color disbaleTextColor = const Color(0xff4A454E);
  final Color info = const Color(0xffF1AF05);
  final Color infoBorder = const Color(0xffECDBB8);
  final Color errorBackground = const Color(0xffFFECF2);
  final Color grey = const Color(0xffE4E4E4);
  final Color darkGrey = const Color(0xffC7C7C7);
  final Color extraDarkGrey = const Color(0xffBFBFBF);
  final Color lightBlack = const Color(0xff212121);
  final Color lightGrey = const Color(0xffFAFAFA);
  final Color drawerTextColor = const Color(0xff2D2E2E);

  const ColorPalette({
    required this.primary,
    required this.lightPrimary,
    required this.extraLightPrimary,
    required this.extraExtraLightPrimary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secoundry,
    required this.darkSecoundry,
    required this.onSecoundry,
    required this.secoundryContainer,
    required this.onSecoundryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.scaffoldBackground,
    required this.background,
    required this.darkBackground,
    required this.onBackground,
    required this.border,
    required this.hint,
    required this.surface,
    required this.onSurface,
    required this.textPrimary,
    required this.textSecoundry,
    required this.disableColor,
  });

  static ColorPalette light = const ColorPalette(
    primary: Color(0xff7345B6),
    lightPrimary: Color(0xff8D5FD1),
    extraLightPrimary: Color(0xffC197FF),
    extraExtraLightPrimary: Color(0xffEDDCFF),
    onPrimary: Colors.white,
    primaryContainer: Color(0xffEDDCFF),
    onPrimaryContainer: Color(0xff280056),
    secoundry: Color(0xffF672BC),
    darkSecoundry: Color(0xffC34991),
    onSecoundry: Colors.white,
    secoundryContainer: Color(0xffFFD8E8),
    onSecoundryContainer: Color(0xff3C0028),
    error: Color(0xffDE3730),
    onError: Colors.white,
    errorContainer: Color(0xffFFEDEA),
    onErrorContainer: Color(0xff410002),
    scaffoldBackground: Colors.white,
    background: Color(0xffF2F2F2),
    darkBackground: Color(0xffececec),
    onBackground: Color(0xff1D1B1E),
    border: Color(0xff8F8F8F),
    hint: Color(0xff8F8F8F),
    surface: Color(0xffFFFBFF),
    onSurface: Color(0xff1D1B1E),
    textPrimary: Color(0xff313131),
    textSecoundry: Color(0xff757575),
    disableColor: Color(0xffAEAEAE),
  );

  static ColorPalette dark = const ColorPalette(
    primary: Color(0xffD6BAFF),
    lightPrimary: Color(0xff8D5FD1),
    extraLightPrimary: Color(0xffC197FF),
    extraExtraLightPrimary: Color(0xffEDDCFF),
    onPrimary: Color(0xff430585),
    primaryContainer: Color(0xff5A2A9D),
    onPrimaryContainer: Color(0xffEDDCFF),
    secoundry: Color(0xffFFAFD6),
    darkSecoundry: Color(0xffC34991),
    onSecoundry: Color(0xff620043),
    secoundryContainer: Color(0xff86115E),
    onSecoundryContainer: Color(0xffFFD8E8),
    error: Color(0xffFFB4AB),
    onError: Color(0xff690005),
    errorContainer: Color(0xffBA1A1A),
    onErrorContainer: Color(0xffFFDAD6),
    scaffoldBackground: Color(0xffF2F2F2),
    background: Color(0xff1D1B1E),
    darkBackground: Color(0xffececec),
    onBackground: Color(0xffE7E1E6),
    border: Color(0xffE4E4E4),
    hint: Color(0xff8F8F8F),
    surface: Color(0xff1D1B1E),
    onSurface: Color(0xffE7E1E6),
    textPrimary: Color(0xff313131),
    textSecoundry: Color(0xff757575),
    disableColor: Color(0xffAEAEAE),
  );

  factory ColorPalette.of(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return light;
    } else {
      return dark;
    }
  }

  factory ColorPalette.fromBrightness(Brightness brightness) =>
      brightness == Brightness.light ? light : dark;
}
