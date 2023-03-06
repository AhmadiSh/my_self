import 'package:flutter/material.dart';
import 'package:my_self/madules/auth/bloc/auth_bloc.dart';
import 'package:my_self/madules/main/bloc/like_bloc.dart';
import 'package:my_self/madules/main/bloc/main_bloc.dart';
import 'package:provider/provider.dart';

import 'madules/setting/bloc/theme_bloc.dart';
import 'madules/splash/ui/pages/splash_page.dart';

class MySelfApp extends StatelessWidget {
  const MySelfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ThemeBloc()..init()),
          ChangeNotifierProvider(
            create: (context) => AuthBloc()..init(),
            lazy: false,
          ), 
           ChangeNotifierProvider(
            create: (context) => MainBloc()..getPosts(),
          ),
           ChangeNotifierProvider(
            create: (context) => LikeBloc(),
          ), 
        ],
        child:
            const MaterialApp(debugShowCheckedModeBanner: false, home:SplashPage()));
  }
}
