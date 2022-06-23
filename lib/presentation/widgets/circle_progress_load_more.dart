import 'package:flutter/material.dart';

import '../../common/constants/images_const.dart';

class CircleProgressLoadMore extends StatelessWidget {
  final double? size;

  CircleProgressLoadMore({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        ImageConstant.loading,
        width: 80,
        height: 80,
      ),
    );
  }
}
