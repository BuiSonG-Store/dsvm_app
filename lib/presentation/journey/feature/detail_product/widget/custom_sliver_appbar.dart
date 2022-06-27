import 'dart:math';

import 'package:dsvm_app/common/constants/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/constants/icon_constant.dart';
import '../../../../../common/utils/screen_utils.dart';
import '../../../../themes/theme_color.dart';
import '../../../../themes/theme_text.dart';
import 'detail_product_top_slide_image.dart';
import 'icon_border_black_bg_opacity.dart';

double heightSliver = 414.0.h;

class DetailProductCustomSliverAppbar extends SliverPersistentHeaderDelegate {
  final Function onClose;
  final Function moveToCart;
  final Function(BuildContext context) onIconMoreTap;
  final Function(bool setFavourite) onFavourite;

  DetailProductCustomSliverAppbar(
      {required this.onFavourite,
        required this.onClose,
        required this.moveToCart,
        required this.onIconMoreTap});

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;
    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    final double animationVal =
    max(0, 2 * scrollAnimationValue(shrinkOffset) - 1);
    return Container(
      height: heightSliver,
      width: MediaQuery.of(context).size.width,
      color: AppColors.green,
      child: Stack(
        children: [
          DetailProductTopSlideImage(
            height: heightSliver,
            enableInfiniteScroll: true,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              children: [
                Opacity(
                  opacity: 1 - animationVal,
                  child: Container(
                    width: double.infinity,
                    height:
                    CommonConst.defaultAppbar + DSVMScreenUtil.statusBarHeight,
                    color: AppColors.green,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height:
                  CommonConst.defaultAppbar + DSVMScreenUtil.statusBarHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: DSVMScreenUtil.statusBarHeight + 12 * animationVal,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 12),
                          IconBorderBackGroundBlackOpacity(
                            icon: IconConst.iconClose,
                            onTap: onClose,
                            opacity: animationVal,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Opacity(
                              opacity: 1 - animationVal,
                              child: Text(
                                "Tên nó lạ lắm",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextTheme.mediumBlack.copyWith(
                                    height: 1.4, color: AppColors.white),
                              ),
                            ),
                          ),
                          Row(
                            children: [

                              IconBorderBackGroundBlackOpacity(
                                icon:
                                IconConst.iconShoppingCart,
                                iconCart: true,
                                opacity: animationVal,
                                number: 0,
                                onTap: moveToCart,
                              ),

                              IconBorderBackGroundBlackOpacity(
                                icon: IconConst.iconFavorite,
                                opacity: animationVal,
                                onTap: () {
                                  onFavourite(true);
                                },
                              ),

                              IconBorderBackGroundBlackOpacity(
                                icon: IconConst.iconMoreWhite,
                                opacity: animationVal,
                                onTap: () {
                                  onIconMoreTap(context);
                                },
                              )
                            ],
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   child: CommonUtil.mapLevelUserToWidget(productEntity?.numberTS),
          //   right: 16,
          //   bottom: 12,
          // )
        ],
      ),
    );
  }

  @override
  double get maxExtent => heightSliver;

  @override
  double get minExtent =>
      CommonConst.defaultAppbar + DSVMScreenUtil.statusBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
