import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../common/utils/common_utils.dart';
import '../../../../../themes/theme_color.dart';
import '../../../../../themes/theme_text.dart';
import '../../../../../widgets/custom_gesturedetector.dart';
import 'grid_view_product.dart';
import 'item_product.dart';

class LayoutDisplayRandomListProduct extends StatelessWidget {
  final Function(int? idCategory, String? title)? onTapSeeAll;
  final Function(ProductModelV2 productEntity)? onItemtap;
  final List<ProductModelV2>? data;
  final String? labelTop;
  final String? textButton;
  final int? idCategory;
  final bool? haveBottomSpaceGrey;
  final bool haveSeeMore;
  final ScrollController? scrollController;
  final bool? lastWidget;
  final Function? onTabLastWidget;
  final bool? haveLogoGstore;

  const LayoutDisplayRandomListProduct(
      {Key? key,
      this.onTapSeeAll,
      this.onItemtap,
      this.textButton,
      this.data,
      this.labelTop,
      this.lastWidget,
      this.onTabLastWidget,
      this.scrollController,
      this.haveLogoGstore,
      this.haveSeeMore = true,
      this.haveBottomSpaceGrey = false,
      this.idCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widgetItem = 178.w;
    final sizeImage = 178.w;
    if (CommonUtil.isEmptyOrNull(data)) return const SizedBox();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Text(
                labelTop ?? '',
                style: AppTextTheme.mediumBlack
                    .copyWith(color: AppColors.green, fontSize: 16),
              ),
              const Spacer(),
              haveSeeMore
                  ? InkWell(
                      onTap: () {
                        if (onTapSeeAll != null) {
                          onTapSeeAll!(idCategory, labelTop);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 16, right: 16, top: 16, bottom: 12),
                        child: Text(
                          "Xem thêm",
                          style: AppTextTheme.normalBlue,
                        ),
                      ),
                    )
                  : const SizedBox(height: 40),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 282,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                if (index == (data?.length ?? 0) - 1 &&
                    (data?.length ?? 0) == 12 &&
                    lastWidget == true) {
                  return Row(
                    children: [
                      ItemWidget(
                        oldModel: ProductModelV2(),
                        widgetItem: widgetItem,
                        sizeImage: sizeImage,
                        onItemTap: (model) {},
                      ),
                      CustomGestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Xem\nthêm',
                            style: AppTextTheme.normalBlue.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (onTabLastWidget != null) {
                            onTabLastWidget!();
                          }
                        },
                      )
                    ],
                  );
                }
                return ItemWidget(
                  oldModel: ProductModelV2(),
                  widgetItem: widgetItem,
                  sizeImage: sizeImage,
                  onItemTap: onItemtap,
                );
              },
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 8);
              },
              itemCount: data!.length),
        ),
        (haveBottomSpaceGrey ?? false)
            ? Container(height: 8.0, color: AppColors.grey3)
            : const SizedBox(),
      ],
    );
  }
}

class LayoutDisplayRandomListProductShimmer extends StatelessWidget {
  final bool isPhone;

  const LayoutDisplayRandomListProductShimmer({Key? key, this.isPhone = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grey300,
      highlightColor: AppColors.grey100,
      child: Container(
        width: double.infinity,
        height: 146.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: AppColors.white,
                      height: 20.0,
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      width: double.infinity,
                      color: AppColors.white,
                      height: 20.0,
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: double.infinity,
                      color: AppColors.white,
                      height: 15.0,
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: AppColors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
