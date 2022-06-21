import 'package:dsvm_app/common/constants/images_const.dart';
import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/common/navigation/route_names.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initData();
    super.initState();
  }
  Future initData()async {
    Future.delayed(Duration(seconds: 5), (){
      Routes.instance.navigateAndRemove(RouteName.containerScreen);
    });
  }
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
