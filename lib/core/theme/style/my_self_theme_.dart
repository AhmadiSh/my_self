// import 'package:flutter/material.dart';

// class LiomTheme {
//   static bool isDark(BuildContext context) => Theme.of(context).brightness == Brightness.dark ? true : false;

//   static Future<String> getThemeId() async {
//     String currentThemeId = await ThemeCache.getThemeId();
//     if (currentThemeId == ThemeMode.light.toString() || currentThemeId == ThemeMode.dark.toString()) {
//       return currentThemeId;
//     } else {
//       return getThemeIdBySystem();
//     }
//   }

//   static String getThemeIdBySystem() => isSystemDark() ? ThemeMode.dark.toString() : ThemeMode.light.toString();

//   static bool isSystemDark() => WidgetsBinding.instance.window.platformBrightness == Brightness.dark;

//   static final ThemeData light = ThemeData(
//     useMaterial3: true,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     fontFamily: Assets.yekanBakhFont,
//     brightness: Brightness.light,
//     primaryColor: ColorPalette.light.primary,
//     shadowColor: ColorPalette.light.black.withOpacity(0.8),
//     popupMenuTheme: const PopupMenuThemeData(
//       enableFeedback: true,
//     ),
//     splashColor: Colors.transparent,
//     highlightColor: Colors.transparent,
//     dividerColor: ColorPalette.light.border,
//     hintColor: ColorPalette.light.border,
    
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: ColorPalette.light.scaffoldBackground,
  
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: ColorPalette.light.border, width: 1),
//       ),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(ColorPalette.light.primary),
//         foregroundColor: MaterialStateProperty.all(Colors.white),
//         elevation: MaterialStateProperty.all(0),
//         shape: MaterialStateProperty.all(
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         ),
//       ),
//     ),
//     textTheme: TextTheme(
//       overline: Typography.englishLike2018.overline!.copyWith(
//         fontSize: 14,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 0,
//         height: 1.5,
//       ),
//       caption: Typography.englishLike2018.caption!.copyWith(
//         fontSize: 12,
//         color: ColorPalette.light.textPrimary,
//         height: 1.5,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 0,
//       ),
//       button: Typography.englishLike2018.button!.copyWith(
//         fontSize: 16,
//         color: Colors.white,
//         height: 1.5,
//         fontWeight: FontWeight.w600,
//         letterSpacing: 0,
//       ),
//       bodyText2: Typography.englishLike2018.bodyText2!.copyWith(
//         fontSize: 14,
//         color: ColorPalette.light.textPrimary,
//         height: 1.5,
//         fontWeight: FontWeight.w500,
//         letterSpacing: 0,
//       ),
//       bodyText1: Typography.englishLike2018.bodyText1!.copyWith(
//         fontSize: 16,
//         color: ColorPalette.light.textPrimary,
//         height: 1.5,
//         fontWeight: FontWeight.w700,
//         letterSpacing: 0,
//       ),
//       subtitle2: Typography.englishLike2018.subtitle2!.copyWith(
//         fontSize: 16,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w500,
//         height: 1.5,
//         letterSpacing: 0,
//       ),
//       subtitle1: Typography.englishLike2018.subtitle1!.copyWith(
//         fontSize: 18,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w500,
//         height: 1.5,
//         letterSpacing: 0,
//       ),
//       headline1: Typography.englishLike2018.headline1!.copyWith(
//         fontSize: 96,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w300,
//         height: 1.5,
//         letterSpacing: 0,
//         // fontWeight: FontWeight.w500,
//       ),
//       headline2: Typography.englishLike2018.headline2!.copyWith(
//         fontSize: 60,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w300,
//         height: 1.5,
//         letterSpacing: 0,
//       ),
//       headline3: Typography.englishLike2018.headline3!.copyWith(
//         fontSize: 48,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w400,
//         height: 1.5,
//         letterSpacing: 0,
//       ),
//       headline4: Typography.englishLike2018.headline4!.copyWith(
//         fontSize: 34,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w400,
//         height: 1.5,
//         letterSpacing: 0,
//       ),
//       headline5: Typography.englishLike2018.headline5!.copyWith(
//         fontSize: 24,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w400,
//         height: 1.5,
//         letterSpacing: 0,
//       ),
//       headline6: Typography.englishLike2018.headline6!.copyWith(
//         fontSize: 20,
//         color: ColorPalette.light.textPrimary,
//         fontWeight: FontWeight.w500,
//         height: 1.5,
//         letterSpacing: 0,
//       ),
//     ).apply(),
//   );

//   static final ThemeData dark = ThemeData(
//     useMaterial3: true,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     fontFamily: Assets.yekanBakhFont,
//     brightness: Brightness.dark,
//     primaryColor: ColorPalette.dark.primary,
//     splashColor: ColorPalette.dark.primary.withOpacity(0.2),
//     highlightColor: Colors.transparent,
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all(ColorPalette.dark.primary),
//         foregroundColor: MaterialStateProperty.all(Colors.white),
//         elevation: MaterialStateProperty.all(0),
//         shape: MaterialStateProperty.all(
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//     ),
//   );
// }
