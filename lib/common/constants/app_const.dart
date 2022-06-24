import 'package:flutter/material.dart';

import '../../presentation/themes/theme_color.dart';

class CommonConst {
  static const double defaultHeightBottomNavigationScreenContainer = 60.0;
  static const double defaultHeightButtonBottom = 48.0;
  static const double defaultMarginTopOfBottomSheet = 44;
  static const double defaultHeightKeyBoard = 175;
  static const double defaultAppbar = 56;
  static const double heightTimeLine = 159;
  static const double widthDesign = 414;
  static const double heightDesign = 896;
  static const double paddingHoz17 = 17;
  static const double paddingHoz16 = 16;
  static const double paddingHoz24 = 24;
  static const double ratioCitizenId = 1.585;
  static BoxDecoration decoration = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: AppColors.grey,
        blurRadius: 4,
        offset: Offset(0, 0), // Shadow position
      ),
    ],
  );
}
