import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

import '../themes/theme_color.dart';

const defaultTabBarHeight = 40.0;

class TabViewBottom extends StatefulWidget {
  final List<String>? titlesTab;
  final double? titleSize;
  final List<Widget>? tabs;
  final double? height;
  final double? widthTitleTab;
  final bool twoTab;
  final bool neverScroll;
  final TabController? tabController;
  final bool stretchCenter;
  final bool haveDes;
  final String? desTitle;

  TabViewBottom(
      {Key? key,
      this.tabs,
      this.widthTitleTab,
      this.titleSize,
      this.height,
      this.twoTab = false,
      this.tabController,
      this.titlesTab,
      this.neverScroll = false,
      this.stretchCenter = true,
      this.haveDes = false,
      this.desTitle})
      : super(key: key);

  @override
  _TabViewBottomState createState() => _TabViewBottomState();
}

class _TabViewBottomState extends State<TabViewBottom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.titlesTab?.length ?? 0,
      child: Column(
        children: [
          widget.haveDes
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.desTitle ?? '',
                    style: AppTextTheme.normalGrey,
                  ),
                )
              : SizedBox(),
          SizedBox(
            width: double.infinity,
            height: defaultTabBarHeight,
            child: TabBar(
              isScrollable: true,
              unselectedLabelColor: AppColors.grey7,
              controller: widget.tabController,
              labelColor: AppColors.green,
              physics: widget.neverScroll
                  ? const NeverScrollableScrollPhysics()
                  : null,
              indicatorColor: AppColors.green,
              tabs: widget.titlesTab!.map((value) {
                return widget.stretchCenter
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            value,
                            maxLines: 1,
                            textScaleFactor: 1,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: widget.titleSize ?? 14.0),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: widget.titleSize ?? 14.0),
                        ),
                      );
              }).toList(),
            ),
          ),
          widget.height == null
              ? Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: TabBarView(
                      controller: widget.tabController,
                      physics: widget.neverScroll
                          ? const NeverScrollableScrollPhysics()
                          : null,
                      children: widget.tabs ?? [],
                    ),
                  ),
                )
              : SizedBox(
                  width: double.infinity,
                  height: widget.height,
                  child: TabBarView(
                    controller: widget.tabController,
                    physics: widget.neverScroll
                        ? const NeverScrollableScrollPhysics()
                        : null,
                    children: widget.tabs ?? [],
                  ),
                ),
        ],
      ),
    );
  }
}
