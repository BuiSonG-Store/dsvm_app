import 'dart:core';

import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_gesturedetector.dart';
import 'package:dsvm_app/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/constants/app_const.dart';
import '../../../common/constants/images_const.dart';
import '../../routes.dart';

class LocationShop extends StatelessWidget {
  const LocationShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: CustomAppBar(
        title: 'Các của hàng',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                '*Chọn địa chỉ bất kì để đến google map',
                style: AppTextTheme.normalGrey,
              ),
            ),
            _Item(
              url: 'https://goo.gl/maps/oHD3Ap4BtkA5cTLr8',
              name: StringConst.listShop[0],
            ),
            _Item(
              url: 'https://goo.gl/maps/mmKiJSQXk1ERMQBC7',
              name: StringConst.listShop[1],
            ),
            _Item(
              url: 'https://goo.gl/maps/BWkV2A38hD2J68adA',
              name: StringConst.listShop[2],
            ),
            _Item(
              url: 'https://goo.gl/maps/agqVJjn5Y8iaUSNK9',
              name: StringConst.listShop[3],
            ),
            _Item(
              url: '',
              name: StringConst.listShop[4],
            ),
            _Item(
              url: '',
              name: StringConst.listShop[5],
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final String url;
  final String name;
  _Item({Key? key, required this.url, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomGestureDetector(
      onTap: () async {
        if (url == '') {
          return null;
        } else {
          if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: CommonConst.decoration,
        child: Row(
          children: [
            Image.asset(
              ImageConstant.logo,
              width: 50,
              height: 50,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: AppTextTheme.mediumBlack,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
            )
          ],
        ),
      ),
    );
  }
}
