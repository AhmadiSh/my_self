import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:my_self/core/router/routes.dart';
import 'package:my_self/madules/main/Ui/pages/main_page.dart';
import 'package:my_self/madules/splash/ui/pages/splash_page.dart';

class MySelfRouter {
  static FluroRouter router = FluroRouter();


  static final TransitionType _transitionFromRight = kIsWeb || !Platform.isIOS
      ? TransitionType.inFromRight
      : TransitionType.cupertino;

        static final TransitionType _tansitionFadeIn = kIsWeb || !Platform.isIOS
      ? TransitionType.fadeIn
      : TransitionType.cupertino;


    static final Map<String, Handler> _fadeInHandlers = <String, Handler>{
    Routes.splashPage: Handler(handlerFunc: (_, __) =>  const SplashPage()),
    Routes.introductionPage: Handler(
      handlerFunc: (_, __) =>  MainPage(),
    ),

    };



  





 static void setupRouter() {
    _fadeInHandlers.forEach(
      (route, handler) => router.define(
        route,
        handler: handler,
        transitionType: _tansitionFadeIn,
        transitionDuration: const Duration(milliseconds: 5)
      ),
    );
   
  }

}
