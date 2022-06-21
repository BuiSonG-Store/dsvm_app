import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:dsvm_app/presentation/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';

import '../../../../themes/theme_color.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 500,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 12, right: 12, top: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey6,
            blurRadius: 8,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageNetwork(
            url: 'http://42.112.36.78:8888/uploads/lk1224143359.png',
            border: 8,
            width: 80,
            height: 80,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Tên sản phẩm ',
                        style: AppTextTheme.mediumBlack,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    CustomGestureDetector(
                      onTap: () {
                        //delete product
                      },
                      child: Icon(
                        Icons.delete_forever,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Gía sp',
                        style: AppTextTheme.mediumPink,
                      ),
                    ),
                    Row(
                      children: [
                        _icon(
                            icon: '-',
                            onTap: () {
                              // hàm trừ số lượng sp
                            },
                            left: true),
                        Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                              color: AppColors.grey3, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              '1',
                              style: AppTextTheme.normalGrey8,
                            ),
                          ),
                        ),
                        _icon(
                            icon: '+',
                            onTap: () {
                              // hàm cộng sp
                            }),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _icon(
          {String? icon,
          Function? onTap,
          bool? left = false,
          double? width,
          double? height,
          Color? color,
          Widget? child,
          bool right = false}) =>
      InkWell(
        onTap: () {
          onTap!();
        },
        child: Padding(
          padding: EdgeInsets.only(
              top: 4,
              right: right ? 0 : 4,
              bottom: 4,
              left: (left ?? false) ? 0 : 4),
          child: Container(
            width: width ?? 24.0,
            height: height ?? 24.0,
            decoration: BoxDecoration(
                color: color ?? AppColors.grey3, shape: BoxShape.circle),
            child: Center(
              child: child ??
                  Text(
                    icon ?? '',
                    style: AppTextTheme.normalGrey8,
                  ),
            ),
          ),
        ),
      );
}
