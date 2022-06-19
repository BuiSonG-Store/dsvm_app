import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CommonUtil {
  static String textHelloInHome() {
    int hour = DateTime.now().hour;
    if (hour >= 4 && hour < 12) {
      return StringConst.goodMorning;
    }
    if (hour == 12) {
      return StringConst.goodLunch;
    }
    if (hour >= 13 && hour <= 18) {
      return StringConst.goodAfterNoon;
    }
    return StringConst.goodEvening;
  }

  static void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool validateAndSave(GlobalKey<FormState> key) {
    FormState? form = key.currentState;
    if (form?.validate() ?? false) {
      form?.save();
      return true;
    }
    return false;
  }
}
