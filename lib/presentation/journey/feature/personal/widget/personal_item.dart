import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:flutter/material.dart';

class ItemPersonal extends StatelessWidget {
  String title;
  String description;
  String icon;
  bool showIconRight;
  bool haveDes;
  Function onTap;
  TextStyle? styleTitle;
  TextStyle? styleDes;
  double? widthIcon;
  double? heightIcon;
  ItemPersonal({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
    this.widthIcon,
    this.heightIcon,
    this.styleTitle,
    this.styleDes,
    required this.description,
    this.showIconRight = true,
    this.haveDes = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: onTap(),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(bottom: BorderSide(color: AppColors.grey3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: widthIcon ?? 30,
              height: heightIcon ?? 30,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: styleTitle ?? AppTextTheme.mediumBlack,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                haveDes
                    ? Text(
                        description,
                        style: styleDes ?? AppTextTheme.smallGrey,
                      )
                    : SizedBox(),
              ],
            ),
            Spacer(),
            showIconRight ? Icon(Icons.navigate_next) : SizedBox()
          ],
        ),
      ),
    );
  }
}
