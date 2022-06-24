import 'dart:math';
import 'package:dsvm_app/presentation/journey/feature/home/suggest_today/widget/item_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/constants/app_const.dart';
import '../../../../../../common/utils/common_utils.dart';
import '../../../../../themes/theme_color.dart';

class OldGridview extends StatelessWidget {
  final bool limitItem;
  final List<ProductModelV2> models;
  final bool ableScroll;
  final ScrollController? controller;
  final Color backgroundColor;

  const OldGridview({
    Key? key,
    required this.models,
    this.ableScroll = false,
    this.limitItem = false,
    this.controller,
    this.backgroundColor = AppColors.grey3,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final widgetItem = 182.w;
    final sizeImage = 162.w;
    var _itemHeight = 182.w + 110;
    final heightList = (limitItem
        ? min(CommonUtil.countNumberRowOfGridview(models), 3)
        : CommonUtil.countNumberRowOfGridview(models)) *
        _itemHeight;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: SizedBox(
        width: double.infinity,
        height: heightList,
        child: GridView.builder(
          itemCount: limitItem ? min(models.length, 6) : models.length,
          controller: controller,
          physics: ableScroll
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: CommonConst.paddingHoz16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: CommonUtil.isPhone() ? 2 : 4,
            crossAxisSpacing: 16.0.w,
            mainAxisExtent: _itemHeight,
          ),
          itemBuilder: (context, index) {
            return ItemWidget(
              oldModel: models[index],
              widgetItem: widgetItem,
              sizeImage: sizeImage,
              onItemTap: (model){},
            );
          },
        ),
      ),
    );
  }
}



class ProductModelV2{
  final String? name;
  ProductModelV2({this.name});
}
