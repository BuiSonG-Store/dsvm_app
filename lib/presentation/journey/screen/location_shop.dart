import 'dart:core';

import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationShop extends StatelessWidget {
  const LocationShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: CustomAppBar(
        title: 'Các của hàng',
      ),
      body: Column(
        children: [
          _Item(
            url: 'https://goo.gl/maps/oHD3Ap4BtkA5cTLr8',
            name:
                'Tổng kho : Lô A52 khu 3ha, Ngõ 36 Đức Diễn, P.Bắc Từ Liêm, Hà Nội',
          )
        ],
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
    void _launchURL() async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      child: Row(
        children: [
          Text(
            name,
            style: AppTextTheme.mediumBlack,
          )
        ],
      ),
    );
  }
}
