import 'package:dsvm_app/common/constants/icon_constant.dart';
import 'package:dsvm_app/common/utils/common_utils.dart';
import 'package:dsvm_app/presentation/routes.dart';
import 'package:flutter/material.dart';

import '../../common/utils/screen_utils.dart';
import '../themes/theme_color.dart';
import '../themes/theme_text.dart';

const double defaultAppbar = 56.0;

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final Widget? customAppBar;
  final Widget? body;
  final Widget? appbarWidget;
  final bool autoDismissKeyboard;
  final bool? resizeToAvoidBottomInset;
  final bool paddingBottom;

  const CustomScaffold({
    Key? key,
    this.backgroundColor,
    this.customAppBar,
    this.body,
    this.appbarWidget,
    this.autoDismissKeyboard = false,
    this.paddingBottom = true,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      body: SafeArea(
        child: Column(
          children: [
            customAppBar ??
                (appbarWidget ??
                    SizedBox(height: DSVMScreenUtil.statusBarHeight)),
            const Divider(height: 1, color: AppColors.grey5),
            Expanded(
              child: GestureDetector(
                  onTap: autoDismissKeyboard
                      ? () {
                          CommonUtil.dismissKeyBoard(context);
                        }
                      : () {},
                  child: body ?? const SizedBox()),
            ),
            SizedBox(
                height: paddingBottom ? DSVMScreenUtil.bottomBarHeight : 0),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showIconLeft;
  final Function? iconLeftTap;
  final bool stylePrimary;
  final bool hasShadow;
  final Widget? widgetRight;
  final Widget? widgetRightTwo;
  final Widget? icon;
  final Color? backgrColor;
  final TextStyle? styleTitle;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.icon,
    this.iconLeftTap,
    this.stylePrimary = false,
    this.hasShadow = true,
    this.widgetRight,
    this.showIconLeft = true,
    this.widgetRightTwo,
    this.backgrColor,
    this.styleTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgrColor ?? AppColors.white,
      width: double.infinity,
      padding: EdgeInsets.only(top: (DSVMScreenUtil.statusBarHeight)),
      height: defaultAppbar + (DSVMScreenUtil.statusBarHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          showIconLeft
              ? GestureDetector(
                  onTap: () {
                    if (iconLeftTap != null) {
                      iconLeftTap!();
                    } else {
                      Routes.instance.pop();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 20, top: 16, bottom: 16),
                    child: Center(
                        child: Image.asset(
                      IconConst.back,
                      width: 10,
                      height: 20,
                      fit: BoxFit.cover,
                    )),
                  ),
                )
              : const SizedBox(),
          icon ?? const SizedBox(),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: styleTitle ?? AppTextTheme.medium20PxBlack,
            ),
          ),
          widgetRightTwo ??
              const SizedBox(
                width: 60,
              ),
          widgetRight ??
              const SizedBox(
                width: 60,
              ),
        ],
      ),
    );
  }
}
