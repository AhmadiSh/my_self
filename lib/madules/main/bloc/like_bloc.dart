import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_self/core/network/api_client.dart';
import 'package:my_self/core/utils/logger_helper.dart';
import 'package:my_self/madules/main/data/model/request_like.dart';


class LikeBloc extends ChangeNotifier {
  bool isSelected = false;
  Color color = Colors.white;
  bool? responseLikes;
  bool isOnselected = false;
  Color color2 = Colors.white;

  isLike() {
    if (isSelected) {
      color = Colors.red;
      isSelected = false;
      notifyListeners();
    } else {
      color = Colors.white;
      isSelected = true;
      notifyListeners();
    }
  }

  isOnlike() {
    if (isOnselected) {
      color2 = Colors.red;
      isOnselected = false;

      notifyListeners();
    } else {
      color2 = Colors.white;
      isOnselected = true;
      notifyListeners();
    }
  }

  refreshcolor() {
    color2 = Colors.white;
    color = Colors.white;
    notifyListeners();
  }

  Future sendlike(LikeRequest responselike) async {
    try {
    await ApiClient().retrofitClient.likePost(responselike);

      notifyListeners();

      return responseLikes;
    } catch (e, s) {
      LoggerHelper.errorLog(e, s);
    }
    return null;
  }
}
