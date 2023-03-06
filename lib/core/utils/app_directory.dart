// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<Directory> appDirectory() async {
  var appDir = await getApplicationDocumentsDirectory();
  return Directory('${appDir.path}/cache').create(recursive: true);
}
