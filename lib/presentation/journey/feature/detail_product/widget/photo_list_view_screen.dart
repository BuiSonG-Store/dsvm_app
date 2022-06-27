import 'package:carousel_slider/carousel_slider.dart';
import 'package:dsvm_app/common/bloc/loading_bloc/loading_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../common/argument/argument.dart';
import '../../../../../common/bloc/loading_bloc/loading_event.dart';
import '../../../../injector_container.dart';
import '../../../../routes.dart';
import '../../../../themes/theme_color.dart';
import '../../../../widgets/custom_image_network.dart';
import '../../../../widgets/custom_scaffold.dart';
import '../../../../widgets/layout_keep_alive.dart';

class PhotoListViewerScreen extends StatefulWidget {
  final ArgumentPhotoViewerScreen? argument;

  const PhotoListViewerScreen({Key? key, this.argument}) : super(key: key);

  @override
  _PhotoListViewerScreenState createState() => _PhotoListViewerScreenState();
}

class _PhotoListViewerScreenState extends State<PhotoListViewerScreen> {
  int _currentSlideIndex = 0;

  @override
  void initState() {
    _currentSlideIndex = widget.argument?.index ?? 0;
    super.initState();
  }

  void _onBack() {
    Routes.instance.pop();
  }

  @override
  void dispose() {
    injector<LoadingBloc>().add(FinishLoading());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.argument?.images?.isEmpty ?? true) {
      return const SizedBox();
    }
    List<Widget> tabs = [];
    List<Widget> points = [];
    for (int i = 0; i < (widget.argument?.images?.length ?? 0); i++) {
      tabs.add(_image(widget.argument?.images![i]));
    }
    return CustomScaffold(
      backgroundColor: AppColors.grey9,
      autoDismissKeyboard: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            // margin: EdgeInsets.symmetric(vertical: 100),
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  initialPage: _currentSlideIndex,
                  height: double.infinity,
                  viewportFraction: 1.0,
                  reverse: false,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlideIndex = index;
                    });
                  },
                ),
                items: tabs,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: points,
            ),
          ),
          Positioned(
            top: 40,
            left: 5,
            child: InkWell(
              onTap: _onBack,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _image(ArgumentCatchDataImage? value) {
    return InteractiveViewer(
      child: LayoutContainWidgetKeepAlive(
        child: (value?.data?.runtimeType == String)
            ? CustomImageNetwork(
          url: value?.data,
          width: double.infinity,
          height: double.infinity,
        )
            : Image.file(
          value?.data,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _point(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentSlideIndex == index ? AppColors.white : AppColors.grey7,
      ),
    );
  }
}
