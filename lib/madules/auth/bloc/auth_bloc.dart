import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_self/core/base/base_box.dart';
import 'package:my_self/core/network/api_client.dart';
import 'package:my_self/core/network/api_response_model.dart';
import 'package:my_self/madules/auth/data/models/response_user.dart';
import 'package:my_self/madules/auth/data/remote/auth_remot_provider.dart';
import 'package:my_self/madules/main/bloc/main_bloc.dart';
import 'package:my_self/madules/main/ui/pages/main_page.dart';


class AuthBloc extends ChangeNotifier {
  // === Singleton Class === //

  factory AuthBloc() => _instance;
  static final AuthBloc _instance = AuthBloc._init();
  AuthBloc._init();

  bool loading = false;
  bool loadedConfig = false;
  bool loadedProfile = false;

  String locale = 'en';

  final BaseBox<ResponseUser> authBox = BaseBox<ResponseUser>('auth_box_myself');
  ResponseUser? responseNewUser;

  Future<void> init() async {
    await authBox.open();
  }

  // === check is authenticated user === //
  // Future<bool> isAuthenticated() async {
  //   LoggerHelper.logger.wtf(authBox.isEmpty);
  //   LoggerHelper.logger.wtf(authBox.length);
  //   if (authBox.isNotEmpty) {
  //     authenticatedUser = await authBox.first();
  //     return true;
  //   }
  //   return false;
  // }

  // === Store date === //
  Future<void> authenticateUser() async {
    if (authBox.isNotEmpty) {
      responseNewUser = await authBox.first();
      await AuthRemoteProvider.logLaunch();
    } else {
      ApiResponseModel<ResponseUser>? response =
          await AuthRemoteProvider.getUserNew();
      authBox['main'] = response?.data ?? ResponseUser();
      await AuthRemoteProvider.logInstall();
      responseNewUser = response?.data;
    }
    ApiClient().setToken(responseNewUser?.token ?? '');

  }

  Future<void> initData( context)async{
    await Future.delayed(const Duration(seconds: 5));
    authenticateUser();
    MainBloc().getPosts();
    Navigator.pushReplacement( context,MaterialPageRoute(builder: (context) => MainPage()));

  }
}
