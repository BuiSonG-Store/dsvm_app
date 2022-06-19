import 'package:dsvm_app/common/constants/images_const.dart';
import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              ImageConstant.logoPng,
            ),
            const Spacer(),
            const Text(
              StringConst.versionApp,
              style: AppTextTheme.smallGrey,
            ),
            SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}
