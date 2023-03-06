import 'package:my_self/core/network/api_client.dart';
import 'package:my_self/core/network/api_response_model.dart';
import 'package:my_self/core/utils/logger_helper.dart';
import 'package:my_self/madules/auth/data/models/response_user.dart';

class AuthRemoteProvider {
  static Future<ApiResponseModel<ResponseUser>?> getUserNew() async {
    try {
      ApiResponseModel<ResponseUser> response =
          await ApiClient().retrofitClient.newUser();
      return response;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      return null;
    }
  }

  static Future<void> logInstall() async {
    try {
      await ApiClient().retrofitClient.logInstall();
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }

  static Future<void> logLaunch() async {
    try {
      await ApiClient().retrofitClient.logLunch();
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
  }
}
