import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dsvm_app/presentation/journey/feature/cart/cart_screen.dart';
import 'package:dsvm_app/presentation/journey/feature/webview/webview_screen.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';

import '../../feature/home/home_screen.dart';
import '../../feature/home/home_screen_v2.dart';
import '../../feature/personal/personal_screen.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({Key? key}) : super(key: key);

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  bool hideText = false;
  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeScreenV2(),
          Container(),
          CartScreen(),
          PersonalScreen(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.white,
        color: AppColors.green,
        buttonBackgroundColor: AppColors.green,
        height: 50,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: AppColors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: AppColors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: AppColors.white,
          ),
          Icon(
            Icons.compare_arrows,
            size: 30,
            color: AppColors.white,
          ),
        ],
        onTap: onTapped,
      ),
    );
  }
}
