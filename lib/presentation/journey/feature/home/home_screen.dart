import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsvm_app/presentation/journey/feature/home/widget/list_random_product.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/common_utils.dart';
import '../../../themes/theme_color.dart';
import '../../../widgets/custom_image_network.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void _goToCart() {}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller = ScrollController();
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  int _currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: Text(
          CommonUtil.textHelloInHome(),
          style: AppTextTheme.medium,
        ),
        actions: [
          IconButton(onPressed: _goToCart, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      initialPage: 0,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      viewportFraction: 1.0,
                      reverse: false,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentSlideIndex = index;
                        });
                      },
                    ),
                    items: imgList
                        .map((item) => CustomImageNetwork(
                              url: item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              border: 12,
                            ))
                        .toList(),
                  ),
                ),
                Positioned(
                    bottom: 18,
                    right: 18,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.white.withOpacity(0.6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child:
                            Text('${_currentSlideIndex + 1}/${imgList.length}'),
                      ),
                    ))
              ],
            ),
            ListRandomProduct()
          ],
        ),
      ),
    );
  }
}
