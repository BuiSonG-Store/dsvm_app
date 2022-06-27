import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsvm_app/presentation/journey/feature/home/suggest_today/widget/grid_view_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/argument/argument.dart';
import '../../../../../common/navigation/route_names.dart';
import '../../../../routes.dart';
import '../../../../themes/theme_color.dart';
import '../../../../widgets/custom_gesturedetector.dart';
import '../../../../widgets/custom_image_network.dart';
import '../../../../widgets/layout_keep_alive.dart';

class DetailProductTopSlideImage extends StatefulWidget {
  final List<String>? images;
  final double? height;
  final bool autoPlay;
  final bool revert;
  final Duration? duration;
  final bool enableInfiniteScroll;

  const DetailProductTopSlideImage({
    Key? key,
    this.images,
    this.height,
    this.autoPlay = false,
    this.revert = false,
    this.duration,
    this.enableInfiniteScroll = false,
  }) : super(key: key);

  @override
  _TopSlideImageState createState() => _TopSlideImageState();
}

class _TopSlideImageState extends State<DetailProductTopSlideImage> {

  List<ImageModel> listImage = [
  ImageModel(id: 1, url: "http://42.112.36.78:8888/uploads/trau_gac_b224202067.png"),
  ImageModel(id: 2, url: "http://42.112.36.78:8888/uploads/trau_gac_b224202067.png"),
  ImageModel(id: 3, url: "http://42.112.36.78:8888/uploads/trau_gac_b224202067.png"),
  ImageModel(id: 4, url: "http://42.112.36.78:8888/uploads/trau_gac_b224202067.png"),
  ImageModel(id: 5, url: "http://42.112.36.78:8888/uploads/trau_gac_b224202067.png"),
  ImageModel(id: 6, url: "http://42.112.36.78:8888/uploads/trau_gac_b224202067.png"),
  ImageModel(id: 7, url: "http://42.112.36.78:8888/uploads/trau_gac_b224202067.png"),
  ];
  int _currentSlideIndex = 0;

  void _onSlideImageTab(int index) {
    List<ArgumentCatchDataImage> images = [];
    for (final obj in listImage) {
      images.add(ArgumentCatchDataImage(data: obj.url));
    }
    Routes.instance.navigateTo(RouteName.photoListViewerScreen,
        arguments: ArgumentPhotoViewerScreen(
            images: images,
            index: index));
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [];
    List<Widget> point = [];

    for (int i = 0; i < listImage.length; i++) {
      tabs.add(_image(listImage[i].url, listImage[i].id));
      point.add(_point(i));
    }
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: widget.height ?? 248.0.h,
          child: CarouselSlider(
            options: CarouselOptions(
              initialPage: 0,
              height: double.infinity,
              autoPlay: widget.autoPlay,
              autoPlayAnimationDuration:
              widget.duration ?? Duration(seconds: 3),
              viewportFraction: 1.0,
              reverse: widget.revert,
              enableInfiniteScroll: widget.enableInfiniteScroll,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSlideIndex = index;
                });
              },
            ),
            items: tabs,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Row(
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: point,
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _image(String url, int index) {
    return CustomGestureDetector(
      onTap: () {
        _onSlideImageTab(index);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.grey4,
              width: 1,
            )),
        child: LayoutContainWidgetKeepAlive(
          child: CustomImageNetwork(
            url: url,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _point(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentSlideIndex == index ? AppColors.grey3 : AppColors.grey6,
      ),
    );
  }
}


class ImageModel{
  int id;
  String url;

  ImageModel({required this.id, required this.url});
}
