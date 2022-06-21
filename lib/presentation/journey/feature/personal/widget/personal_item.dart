import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:flutter/material.dart';

class ItemPersonal extends StatelessWidget {
  final String title;
  final String description;
  final String icon;
  final bool showIconRight;
  final bool haveDes;
  final Function? onTap;
  final TextStyle? styleTitle;
  final TextStyle? styleDes;
  final double? widthIcon;
  final double? heightIcon;
  ItemPersonal({
    Key? key,
    this.onTap,
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
      onTap: (){
        onTap!();
      },
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
                Container(
                  width: MediaQuery.of(context).size.width - (widthIcon ?? 30) -60,
                  child: Text(
                    title,
                    style: styleTitle ?? AppTextTheme.mediumBlack,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
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
