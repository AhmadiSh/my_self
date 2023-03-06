import 'package:flutter/material.dart';
import 'package:my_self/core/constants/constants.dart';
import 'package:my_self/core/utils/logger_helper.dart';

// import 'package:liom_app/core/constants/constants.dart';
// import 'package:liom_app/core/utils/logger_helper.dart';

class AppConfig {
  static const String appName = 'my self';

  static const String localePath = 'assets/langs';
  static const List<Locale> supportedLocales = <Locale>[
    Locale('fa', 'IR'),
    Locale('en', 'US'),
  ];

  static const Locale startLocal = Locale('fa', 'IR');

  static const String vesion = '1.0.0';

  static void handleUniLink(String link, BuildContext context) {
    try {
      if (link.startsWith(Constants.baseUrl)) {

      }
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }
}
