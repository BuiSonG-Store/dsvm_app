import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import '../../presentation/routes.dart';
import '../../presentation/themes/theme_color.dart';

class CommonUtil {
  static bool isPhone() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    return data.size.shortestSide < 600;
  }

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

  static void mapListenerSnackBarState(SnackBarState state) {
    if (state is ShowSnackBarState) {
      var icon;
      var color;
      var title;
      switch (state.type) {
        case SnackBarType.success:
          icon = Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          );
          color = Colors.green;
          title = "Thành công";
          break;
        case SnackBarType.warning:
          icon = Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = Colors.orange;
          title = "Cảnh báo";
          break;
        case SnackBarType.error:
          icon = Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = Colors.red;
          title = "Thất bại";
          break;
        default:
          icon = Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = Colors.grey;
          title = "Thông báo";
          break;
      }

      showFlash(
        context: Routes.instance.navigatorKey.currentContext!,
        duration: state.duration ?? Duration(milliseconds: 3000),
        builder: (context, controller) {
          return Flash.bar(
            controller: controller,
            backgroundColor: color,
            position: FlashPosition.top,
            horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
            margin: const EdgeInsets.all(8),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            forwardAnimationCurve: Curves.easeOutBack,
            reverseAnimationCurve: Curves.easeInCubic,
            child: FlashBar(
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Colors.white),
              ),
              content: Text(
                state.mess ?? '',
                style: TextStyle(color: Colors.white),
              ),
              icon: icon,
              shouldIconPulse: true,
              showProgressIndicator: false,
            ),
          );
        },
      );
    }
  }
  static Gradient getGradient(
      {List<Color>? colors, GradientDirection? gradientDirection}) {
    Alignment _getGradientDirection(String key) {
      final Map<String, Alignment> map = {
        'begin': Alignment.topCenter,
        'end': Alignment.bottomCenter
      };
      if (gradientDirection == null) {
        return map[key] ?? Alignment.topCenter;
      }
      switch (gradientDirection) {
        case GradientDirection.ltr:
          map['begin'] = Alignment.centerLeft;
          map['end'] = Alignment.centerRight;
          break;
        case GradientDirection.rtl:
          map['begin'] = Alignment.centerRight;
          map['end'] = Alignment.centerLeft;
          break;
        case GradientDirection.ttb:
          map['begin'] = Alignment.topCenter;
          map['end'] = Alignment.bottomCenter;
          break;
        case GradientDirection.btt:
          map['begin'] = Alignment.bottomCenter;
          map['end'] = Alignment.topCenter;
          break;
      }
      return map[key] ?? Alignment.topCenter;
    }

    return LinearGradient(
      colors: colors ?? [AppColors.grey5, AppColors.grey5],
      begin: _getGradientDirection('begin'),
      end: _getGradientDirection('end'),
    );
  }

  static String getTwoCharOfName(String? name) {
    try {
      if (name == null || name.isEmpty) {
        return '';
      }
      List<String> listChar = name.trim().split(' ');
      if (listChar.length == 1) {
        if (listChar[0].length == 1) {
          return listChar[0].toUpperCase();
        } else {
          return listChar[0].substring(0, 2).toUpperCase();
        }
      }
      return '${listChar[0].substring(0, 1)}${listChar.last.substring(0, 1)}'
          .toUpperCase();
    } catch (_) {
      return name ?? '';
    }
  }

  static int countNumberRowOfGridview(List? data) {
    if (data?.isEmpty ?? true) {
      return 1;
    }
    if (data!.length % 2 == 0) {
      return data.length ~/ 2;
    }
    return (data.length + 1) ~/ 2;
  }

  static bool isEmptyOrNull(dynamic obj) {
    try {
      return obj == null || obj.isEmpty;
    } catch (e) {
      return true;
    }
  }

}

enum GradientDirection { rtl, ltr, ttb, btt }
