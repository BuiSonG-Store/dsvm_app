import 'package:dsvm_app/common/constants/app_const.dart';
import 'package:dsvm_app/common/network/configs.dart';
import 'package:dsvm_app/common/utils/format_util.dart';
import 'package:dsvm_app/data/model/product_model.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/widgets/custom_cache_image_network.dart';
import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../themes/theme_text.dart';

class ItemWidget extends StatelessWidget {
  final ProductModel productModel;
  final double widgetItem;
  final double sizeImage;
  final Function(ProductModel oldModel)? onItemTap;

  const ItemWidget({
    Key? key,
    required this.productModel,
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
          url:  '${Configurations.hostImage}${productModel.image}',
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
        if (onItemTap != null) {
          onItemTap!(productModel);
          return;
        }
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
              productModel.product?.name ?? "",
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
                   "${FormatUtils.formatCurrencyDoubleToString(productModel.product?.price)}",
                  maxLines: 1,
                  style: AppTextTheme.mediumBlack.copyWith(
                      fontSize: 16,
                      color: AppColors.green
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  " / ${productModel.product?.dvt ?? " kg"}",
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