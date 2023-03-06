// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:liom_app/core/theme/data/theme_cache.dart';
// import 'package:liom_app/core/theme/style/my_self_theme_.dart';
// import 'package:liom_app/core/theme/style/theme_mode.dart';
// import 'package:theme_provider/theme_provider.dart';

// class ThemeBloc extends ChangeNotifier {
//   ThemeBloc() {
//     loadCurrentTheme();
//   }

//   String _currentThemeId = theme.system.toString();

//   theme get currentTheme {
//     if (_currentThemeId == theme.light.toString()) {
//       return theme.light;
//     } else if (_currentThemeId == theme.dark.toString()) {
//       return theme.dark;
//     } else {
//       return theme.system;
//     }
//   }

//   theme get currentThemeNoSystem {
//     String themeIdNoSystem =
//         _currentThemeId == theme.system.toString() ? LiomTheme.getThemeIdBySystem() : _currentThemeId;
//     if (themeIdNoSystem == theme.light.toString()) {
//       return theme.light;
//     } else {
//       return theme.dark;
//     }
//   }

//   set currentTheme(theme value) {
//     _currentThemeId = value.toString();
//     notifyListeners();
//   }

//   Future<String> loadCurrentTheme() async {
//     _currentThemeId = await ThemeCache.getThemeId();
//     notifyListeners();
//     return _currentThemeId;
//   }

//   Future<void> loadAndApplyTheme(BuildContext context) async {
//     _currentThemeId = await ThemeCache.getThemeId();
//     ThemeProvider.controllerOf(context).setTheme(currentThemeNoSystem.toString());
//     notifyListeners();
//   }

//   void setNewTheme(BuildContext context, String newThemeId) {
//     _currentThemeId = newThemeId;
//     notifyListeners();
//     ThemeCache.setThemeId(newThemeId);
//     ThemeProvider.controllerOf(context)
//         .setTheme(newThemeId == theme.system.toString() ? LiomTheme.getThemeIdBySystem() : newThemeId);
//   }

//   Future<void> onSystemBrightnessChanged(BuildContext context, Brightness brightness) async {
//     await loadCurrentTheme();
//     if (currentTheme == theme.system) {
//       if (brightness == Brightness.light) {
//         ThemeProvider.controllerOf(context).setTheme(theme.light.toString());
//       } else if (brightness == Brightness.dark) {
//         ThemeProvider.controllerOf(context).setTheme(theme.dark.toString());
//       }
//     }
//   }
// }
