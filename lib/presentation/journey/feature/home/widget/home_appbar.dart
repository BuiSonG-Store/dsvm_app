import 'package:dsvm_app/presentation/journey/feature/home/widget/search_in_home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/utils/common_utils.dart';
import '../../../../../common/utils/log_util.dart';
import '../../../../../common/utils/screen_utils.dart';
import '../../../../themes/theme_color.dart';
import '../../../../themes/theme_text.dart';

class HomeAppBar extends StatefulWidget {
  final Function startSearch;

  const HomeAppBar({
    Key? key,
    required this.startSearch,
  }) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  double _maxHeightAppBar = 60;
  double _currentPosition = 0;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double animationVal = 1 - min(_currentPosition / _maxHeightAppBar, 1);
    double visibleMainHeight =
    max(150.0.h * animationVal, 78.0 + DSVMScreenUtil.statusBarHeight);
    LOG.w('animationVal: $animationVal');
    return Container(
      height: visibleMainHeight,
      width: MediaQuery.of(context).size.width,
      color: AppColors.primaryColor,
      child: Stack(
        children: [
          Column(
            children: [
              Opacity(
                  opacity: animationVal,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: CommonUtil.getGradient(colors: [
                          Color(0xff4EC6EA),
                          Color(0xff3FB993),
                          Color(0xffF1C35C).withOpacity(0.8),
                          Color(0xffE93C71).withOpacity(0.7),
                        ])),
                    width: double.infinity,
                    height: visibleMainHeight - 30,
                  )),
              Stack(
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: animationVal == 0
                        ? AppColors.primaryColor
                        : AppColors.white,
                  ),
                  Opacity(
                    opacity: 1 - animationVal,
                    child: Container(
                      width: double.infinity,
                      height: 30 * (1 - animationVal),
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                "Chào",
                                style: AppTextTheme.normalWhite
                                    .copyWith(fontSize: 18.0)),
                            TextSpan(
                                text:
                                "Mày",
                                style: AppTextTheme.normalWhite.copyWith(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                          style: DefaultTextStyle.of(context).style,
                        ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LayoutTopSearchInHomeScreen(
                  onSearch: widget.startSearch,
                  haveShadow: animationVal == 0,
                ),
              ),
              SizedBox(height: 10)
            ],
          )
        ],
      ),
    );
  }
}
