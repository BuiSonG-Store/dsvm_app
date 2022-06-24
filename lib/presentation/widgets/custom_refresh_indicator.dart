import 'package:flutter/material.dart';
import '../themes/theme_color.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;
  final Color? backGrColor;
  const CustomRefreshIndicator(
      {Key? key,
        required this.onRefresh,
        required this.child,
        this.backGrColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: child,
      backgroundColor: backGrColor ?? Colors.white,
      color: AppColors.primaryColor,
      onRefresh: onRefresh,
    );
  }
}
