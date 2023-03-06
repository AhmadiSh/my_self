import 'package:flutter/cupertino.dart';
import 'package:my_self/core/base/base_box.dart';

import 'package:my_self/core/utils/logger_helper.dart';
import 'package:my_self/madules/setting/data/models/them_model.dart';


class ThemeBloc extends ChangeNotifier {
  List<double> fontsize = [10,20,30,];
  final BaseBox<ThemeModel> themebox = BaseBox<ThemeModel>('them_box');

  List<String>? backgrounds;
  double? fontsizes;
  String? fontanames;
  ThemeModel? theme;

  Future<void> init() async {
    await themebox.open();
    // getTheme();
  }

  Future<void> getTheme() async {
    LoggerHelper.logger.wtf(themebox.isEmpty);
    LoggerHelper.logger.wtf(themebox.length);
    if (themebox.isNotEmpty) {
      theme = await themebox.first();
      backgrounds = theme?.background;
      fontanames = theme?.font;
      fontsizes = theme?.fontSize;
    }
    notifyListeners();
  }

  Future<void> setTheme(ThemeModel themeModel) async {
    themebox['theme'] = themeModel;
    backgrounds = themeModel.background;
    fontanames = themeModel.font;
    fontsizes = themeModel.fontSize;
    notifyListeners();
  }
}
