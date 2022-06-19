import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:dsvm_app/presentation/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/theme_color.dart';
import '../themes/theme_text.dart';

class ItemProductTypeOne extends StatelessWidget {
  const ItemProductTypeOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 28) / 2.3;
    return CustomGestureDetector(
      onTap: () {},
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.7),
              blurRadius: 4,
              offset: Offset(2, 5), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: width,
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: CustomImageNetwork(
                  url:
                      'http://42.112.36.78:8888/uploads/trau_gac_b224202067.png',
                  width: width,
                  height: width,
                  fit: BoxFit.cover,
                  border: 16,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              width: double.infinity,
              height: 35.0,
              child: Text(
                'tên sp adj adj asdj asdj alksdjalk jdaksjd kasjdklaj sdlkasjd kja',
                textScaleFactor: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextTheme.normalBlack
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8.0),
            Divider(
              height: 1,
              color: Colors.grey[300],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    Text(
                      '1.000.000đ',
                      style: AppTextTheme.smallGrey
                          .copyWith(color: AppColors.green),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      " / ",
                      style: AppTextTheme.smallGrey
                          .copyWith(color: AppColors.green),
                    ),
                    Text(
                      'Túi',
                      style: AppTextTheme.smallGrey
                          .copyWith(color: AppColors.green),
                    ),
                    Text(
                      " / ",
                      style: AppTextTheme.smallGrey
                          .copyWith(color: AppColors.green),
                    ),
                    Text(
                      "Kg",
                      style: AppTextTheme.smallGrey
                          .copyWith(color: AppColors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
