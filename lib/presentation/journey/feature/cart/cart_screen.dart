import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/presentation/journey/feature/cart/widget/cart_empty.dart';
import 'package:dsvm_app/presentation/journey/feature/cart/widget/item_cart.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/button/button_bottom.dart';
import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:dsvm_app/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/app_const.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          StringConst.cart,
          style: AppTextTheme.medium20PxBlack,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ItemCart(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(12),
        decoration: CommonConst.decoration,
        child: CustomGestureDetector(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Text('Tổng : ', style: AppTextTheme.medium),
                Text('1000000', style: AppTextTheme.medium),
                Spacer(),
                Text('Đặt hàng', style: AppTextTheme.medium),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
