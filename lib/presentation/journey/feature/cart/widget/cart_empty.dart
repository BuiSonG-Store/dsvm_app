import 'package:dsvm_app/common/constants/icon_constant.dart';
import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/common/navigation/route_names.dart';
import 'package:dsvm_app/presentation/routes.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            IconConst.empty_cart,
            width: 120,
            height: 120,
          ),
          SizedBox(height: 12),
          Text(
            StringConst.cart_empty,
            style: AppTextTheme.mediumBlack,
          ),
          CustomGestureDetector(
            onTap: () {
              Routes.instance.navigateTo(RouteName.containerScreen);
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Khám phá ngay !',
                style: AppTextTheme.normalLink
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
