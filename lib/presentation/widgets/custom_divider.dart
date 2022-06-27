import 'package:flutter/material.dart';

import '../themes/theme_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      color: AppColors.grey6,
      height: 0.5,
    );
  }
}
