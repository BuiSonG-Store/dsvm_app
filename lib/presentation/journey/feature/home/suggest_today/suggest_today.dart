import 'package:dsvm_app/presentation/journey/feature/home/suggest_today/widget/grid_view_product.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';


class SuggestToday extends StatefulWidget {
  // final Function(ProductModel product) onItemTap;
  final ScrollController scrollController;
  final String? label;

  const SuggestToday({
    Key? key,
    // required this.onItemTap,
    required this.scrollController,
    this.label,
  }) : super(key: key);

  @override
  _SuggestTodayState createState() => _SuggestTodayState();
}

class _SuggestTodayState extends State<SuggestToday> {
  // SuggestTodayCubit _suggestTodayCubit = injector<SuggestTodayCubit>();
  bool _enableContinueLoadMore = true;
  bool _runFirst = true;

  List<ProductModelV2> oldModels = [
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2(),
    ProductModelV2()
  ];

  @override
  void initState() {
    //widget.scrollController.addListener(_scrollListener);
    super.initState();
  }

  // void _scrollListener() {
  //   if (widget.scrollController.position.extentAfter < 800) {
  //     if (_enableContinueLoadMore) {
  //       _enableContinueLoadMore = false;
  //       if (_runFirst) {
  //         _runFirst = false;
  //         // _suggestTodayCubit.getDataSuggestToday();
  //       } else {
  //        //  _suggestTodayCubit.getMoreSuggestToday();
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.label ?? "Gợi ý hôm nay",
            style: AppTextTheme.medium.copyWith(
              color: AppColors.red,
              fontSize: 16
            ),
          ),
        ),
        Column(
          children: [
            OldGridview(
              models: oldModels,
              controller: widget.scrollController,
              backgroundColor: AppColors.white,
            )
          ],
        )
      ],
    );
  }
}
