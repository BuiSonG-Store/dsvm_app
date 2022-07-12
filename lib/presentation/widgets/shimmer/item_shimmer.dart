import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ItemShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192.w,
      height: 192.w + 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: 182.w,
              height: 182.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 35.0),
            Expanded(
              child: Column(
                children: [
                  Container(
                    width: 182.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColors.white,
                    ),
                    height: 10.0,
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    width: 182.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColors.white,
                    ),
                    height: 15.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
