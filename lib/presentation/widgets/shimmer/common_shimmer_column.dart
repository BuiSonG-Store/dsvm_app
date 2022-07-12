import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'item_shimmer.dart';

class CommonShimmerColumn extends StatefulWidget {
  final Widget? child;
  final int numberItem;

  CommonShimmerColumn({Key? key, this.child, this.numberItem = 2})
      : super(key: key);

  @override
  State<CommonShimmerColumn> createState() => _CommonShimmerColumnState();
}

class _CommonShimmerColumnState extends State<CommonShimmerColumn> {
  List<Widget>? _listWIdget;

  void _initData() {
    _listWIdget = [];
    for (int i = 0; i < widget.numberItem; i++) {
      _listWIdget!.add(ItemShimmer());
    }
  }

  @override
  Widget build(BuildContext context) {
    _initData();
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      child: Shimmer.fromColors(
        baseColor: AppColors.grey300,
        highlightColor: AppColors.grey100,
        child: widget.child ??
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _listWIdget??[],
              )),
      ),
    );
  }
}
