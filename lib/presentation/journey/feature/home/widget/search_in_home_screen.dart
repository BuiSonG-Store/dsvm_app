import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../common/constants/icon_constant.dart';
import '../../../../themes/theme_color.dart';
import '../../../../themes/theme_text.dart';


class LayoutTopSearchInHomeScreen extends StatelessWidget {
  final Function? onSearch;
  final bool haveShadow;

  const LayoutTopSearchInHomeScreen(
      {Key? key, this.onSearch, this.haveShadow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSearch!();
      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
          boxShadow: [
            haveShadow
                ? BoxShadow(color: Colors.white, offset: Offset(0, 0))
                : BoxShadow(
              color: AppColors.grey300,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 11.5),
            SvgPicture.asset(
              IconConst.iconSearch,
              width: 15.0,
              height: 15.0,
            ),
            SizedBox(width: 5.5),
            Text(
              "Bạn muốn tìm gì?",
              style: AppTextTheme.normalGrey,
            ),
          ],
        ),
      ),
    );
  }
}
