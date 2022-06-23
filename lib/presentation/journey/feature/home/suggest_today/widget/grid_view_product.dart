import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../common/constants/app_const.dart';
import '../../../../../../common/utils/common_utils.dart';
import '../../../../../themes/theme_color.dart';
import '../../../../../themes/theme_text.dart';
import '../../../../../widgets/custom_cache_image_network.dart';
import '../../../../../widgets/custom_gesturedetector.dart';

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
            return _OldItemWidget(
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

class _OldItemWidget extends StatelessWidget {
  final ProductModelV2 oldModel;
  final double widgetItem;
  final double sizeImage;
  final Function(ProductModelV2 oldModel)? onItemTap;

  const _OldItemWidget({
    Key? key,
    required this.oldModel,
    required this.widgetItem,
    required this.sizeImage,
    this.onItemTap,
  }) : super(key: key);

  List<Widget> _buildImage() {
    return [
      Container(
        width: sizeImage,
        height: sizeImage,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: CommonConst.colorsGradient),
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(1.0),
        child: CustomCacheImageNetwork(
          url:  'http://42.112.36.78:8888/uploads/trau_gac_b224202067.png',
          width: sizeImage - 2,
          height: sizeImage - 2,
          fit: BoxFit.cover,
          border: 16,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: () {
        // if (onItemTap != null) {
        //   onItemTap!(oldModel);
        //   return;
        // }
        // Routes.instance.navigateTo(RouteName.OldDetailScreen,
        //     arguments: ArgumentOldNewsDetailScreen(
        //       id: oldModel.iD,
        //       liquidation: liquidation,
        //     ));
      },
      child: Container(
        width: widgetItem,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                spreadRadius: 6,
                blurRadius: 7)
          ],
          borderRadius: BorderRadius.circular(17),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
        margin: EdgeInsets.only(
          bottom: 8,
          top: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: _buildImage()
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Thịt trâu gác bếp chuẩn vị Thanh Hóa quê tao",
              maxLines: 2,
              style: AppTextTheme.mediumBlack.copyWith(
                fontSize: 15,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  "40.000đ",
                  maxLines: 1,
                  style: AppTextTheme.mediumBlack.copyWith(
                      fontSize: 20,
                      color: AppColors.green
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  " / kg",
                  maxLines: 1,
                  style: AppTextTheme.mediumBlack.copyWith(
                      fontSize: 15,
                    color: AppColors.grey6
                  ),
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductModelV2{
  final String? name;
  ProductModelV2({this.name});
}
