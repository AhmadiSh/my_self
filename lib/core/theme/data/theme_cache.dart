
// import 'package:my_self/core/resource/cache_provider/config_box.dart';
// import 'package:my_self/core/utils/logger_helper.dart';

// class ThemeCache {
//   static const String _themeIdKey = 'ThemeModeId';

//   static Future<void> setThemeId(String? id) async {
//     try {
//       await ConfigBox.setConfig(_themeIdKey, id);
//     } catch (e) {
//       LoggerHelper.logger.e(e);
//     }
//   }

//   static Future<String> getThemeId() async {
//     String? baseUrl = await ConfigBox.getConfig(_themeIdKey);
//     return baseUrl ?? theme.light.toString();
//   }
// }
