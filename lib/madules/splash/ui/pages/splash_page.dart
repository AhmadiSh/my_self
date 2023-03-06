
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:my_self/madules/auth/bloc/auth_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  //final Timer timer=Timer();
  @override
  void initState() {
    super.initState();
   AuthBloc().initData(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xfffaeee7), Color(0xffffffff)])),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 250),
                child: const Text(
                  'خودم یک برنامه برای',
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontFamily: 'Anjoman',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 55),
                child: SizedBox(
                    child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 30.0, color: Colors.black,fontFamily: 'anjoman'),
                  child: Center(
                    child: AnimatedTextKit(

                      animatedTexts: [
                        TyperAnimatedText(
                            '...ذهن مثبت\n...روحیه مثبت\n...زندگی مثبت',
                            speed: const Duration(milliseconds: 40)),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
