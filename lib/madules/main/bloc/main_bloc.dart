import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:my_self/core/network/api_client.dart';
import 'package:my_self/core/network/response_model.dart';
import 'package:my_self/core/resource/assets/assets.dart';
import 'package:my_self/core/utils/logger_helper.dart';

import 'package:my_self/madules/main/data/model/response_post.dart';
import 'package:my_self/madules/main/data/model/post.dart';
import 'package:my_self/madules/setting/bloc/theme_bloc.dart';

class MainBloc extends ChangeNotifier {
  List<String> background = [
    Assets.airplanepink,
    Assets.bigsur,
    Assets.dark1,
    Assets.dark2,
    Assets.earthygradient,
    Assets.flowershadownew,
    Assets.inclouds,
    Assets.onecloud,
    Assets.purplebridge,
    Assets.roadmark,
    Assets.snowfield,
    Assets.softsunset,
    Assets.treeshadow,
    Assets.waterfall,
  ];
  String? currentbackground;
  bool? responseLikes;
  bool isselected = false;
  Color color = Colors.white;

  factory MainBloc() => _instance;
  static final MainBloc _instance = MainBloc._init();
  MainBloc._init();
  int counter = 0;
  List<Post> lists = [];
  List<Post> list = [];
  int? index;
  late ResponseModel state;
  bool isLoading = false;
  ResponsePost? responseTextItem;
  var response;

  Future getPosts() async {
    state = ResponseModel.loading(
      'isloading',
    );

    try {
      response = await ApiClient().retrofitClient.getPosts('$counter');
      if (response.success == true) {
        list = response.list!;
        for (int i = 0; i < (list.length); i++) {
          lists.add(list[i]);
        }
        counter++;

        state = ResponseModel.completed(response);
      } else {}
      notifyListeners();
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
      notifyListeners();
    }
    return null;
  }

  Color setColorText(String? background) {
    switch (background ?? currentbackground) {
      case Assets.airplanepink:
        {
          return const Color(0xff262626);
        }

      case Assets.bigsur:
        {
          return const Color(0xff262626);
        }

      case Assets.dark1:
        {
          return const Color(0xffffffff);
        }

      case Assets.dark2:
        {
          return const Color(0xffffffff);
        }

      case Assets.earthygradient:
        {
          return const Color(0xff262626);
        }

      case Assets.flowershadownew:
        {
          return const Color(0xff5e3f37);
        }

      case Assets.inclouds:
        {
          return const Color(0xffffffff);
        }

      case Assets.onecloud:
        {
          return const Color(0xff888888);
        }
      case Assets.purplebridge:
        {
          return const Color(0xffffe6ef);
        }
      case Assets.roadmark:
        {
          return const Color(0xffffffff);
        }
      case Assets.snowfield:
        {
          return const Color(0xff000000);
        }

      case Assets.softsunset:
        {
          return const Color(0xffffffff);
        }
      case Assets.treeshadow:
        {
          return const Color(0xff5e3f37);
        }

      case Assets.waterfall:
        {
          return const Color(0xffffffff);
        }

      default:
        return const Color(0xffffffff);
    }
  }




 

  String setBackground() {
    var themes = ThemeBloc().backgrounds?[0];
    if (themes == null) {
      currentbackground = background[Random().nextInt(background.length)];
      return currentbackground!;
    } else {
      currentbackground = ThemeBloc().backgrounds?[0];
      return currentbackground!;
    }
  }


  
}
