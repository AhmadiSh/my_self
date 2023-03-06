import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_self/core/router/myself_router.dart';
import 'package:my_self/core/utils/http_override.dart';
import 'package:my_self/madules/auth/data/models/response_user.dart';
import 'package:my_self/myself_app.dart';
import 'package:hive/hive.dart';
import 'madules/setting/data/models/them_model.dart';

Future<void> main() async {
  HttpOverrides.global = HttpOverride();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ResponseUserAdapter());
  Hive.registerAdapter(ThemeModelAdapter());
    MySelfRouter.setupRouter();

  runApp(MySelfApp());
}



// List<Box> boxList = [];



// Future<List<Box>> _openbox() async {
//   var dir = await getApplicationDocumentsDirectory();
//   Hive.init(dir.path);
//   var authBox = await Hive.openBox('authenticate_box');
//   var themebox = await Hive.openBox("theme_box");

//   boxList.add(authBox);
//   boxList.add(themebox);
//   return boxList;
// }
