import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_self/core/network/response_model.dart';
import 'package:my_self/core/resource/assets/assets.dart';
import 'package:my_self/madules/main/bloc/like_bloc.dart';
import 'package:my_self/madules/main/bloc/main_bloc.dart';
import 'package:my_self/madules/main/data/model/request_like.dart';
import 'package:my_self/madules/setting/bloc/theme_bloc.dart';
import 'package:my_self/madules/setting/ui/pages/theme_page.dart';

import 'package:provider/provider.dart';


import 'widget/exit_dialog.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> willPops() async {

      await showAnimatedDialog(
        animationType: DialogTransitionType.fade,
        curve: Curves.easeIn,
        barrierDismissible: true,
        duration: const Duration(milliseconds: 500),
        builder: (context) => const ExitDialog(),
        context: context,
      );
      return false;
  }

  bool islike = false;
  bool isonlike = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPops,
      child: Scaffold(
          key: _scaffoldKey,
          body: Consumer<MainBloc>(builder: (context, bloc, child) {
            switch (bloc.state.status) {
              case Status.Loading:
                return  const Center(child: CircularProgressIndicator());
              case Status.Completed:
                return PageView(
                    onPageChanged: (page) {
                      if (bloc.lists.length - 2 == page) {
                        bloc.getPosts();
                      } else {
                        print(bloc.counter);
                      }
                    },
                    scrollDirection: Axis.vertical,
                    children: bloc.lists
                        .map(
                          (e) =>
                          Stack(children: [
                            Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          context.select<ThemeBloc, String?>(
                                                  (bloc) =>
                                              bloc.backgrounds?[0]) ??
                                              context.select<
                                                  MainBloc,
                                                  String>(
                                                      (bloc) =>
                                                      bloc.setBackground())),
                                      fit: BoxFit.cover,
                                    ))),
                            Column(
                              children: [
                                Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 120),
                                      child: Text(
                                        e.text ?? '',
                                        style: TextStyle(
                                            color: bloc.setColorText(context
                                                .select<ThemeBloc, String?>(
                                                    (bloc) =>
                                                bloc.backgrounds?[0])),
                                            fontSize: context.select<
                                                ThemeBloc,
                                                double>(
                                                    (bloc) =>
                                                bloc.fontsizes ?? 30),
                                            fontFamily: context
                                                .select<ThemeBloc, String>((
                                                bloc) =>
                                            bloc.fontanames ?? 'anjoman')),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                                Center(
                                  child: Text(
                                    e.catName ?? '',
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontFamily: 'anjoman'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 200, left: 300),
                                  child: Consumer<LikeBloc>(
                                      builder: (context, value, child) {
                                        return Column(
                                children: [
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 20),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (
                                                                context) {
                                                              return SettingPage();
                                                            }));
                                                  },
                                                  child: SvgPicture.asset(
                                                      Assets.setting)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 20),
                                              child: InkWell(
                                                  child: SvgPicture.asset(
                                                      Assets.save)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 20),
                                              child: InkWell(
                                                  child: SvgPicture.asset(
                                                      Assets.upload)),
                                            ),
                                            Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: InkWell(
                                                  onTap: () {
                                                    value.sendlike(
                                                        LikeRequest(
                                                            type: 'like',
                                                            textId: e.id,
                                                            cat: e.cat));
                                                    value.isLike();
                                                  },
                                                  child: SvgPicture.asset(
                                                      Assets.like,
                                                      color: value.color),
                                                )),
                                             Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  vertical: 20),
                                              child: InkWell(
                                                  onTap: () {
                                                    value.sendlike(
                                                        LikeRequest(
                                                            type: 'dislike',
                                                            textId: e.id,
                                                            cat: e.cat));
                                                    value.isOnlike();
                                                  },
                                                  child: SvgPicture.asset(
                                                      Assets.onlike,
                                                      color: value.color2)),
                                            ),
                                            ],
                                        );
                                      }),
                                )
                              ],
                            ),
                            Positioned(
                              bottom: 30,
                              left: 150,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                      child:
                                      SvgPicture.asset(Assets.downpage)),
                                ],
                              ),
                            )
                          ]),
                    )
                        .toList());
            }
          })),
    );
  }

  // void _takescreenshot() async {
  //   final _imagefile = await ScreenshotController().capture();
  //   print(_imagefile);
  //   Share.share(_imagefile.toString());
  // }
}
