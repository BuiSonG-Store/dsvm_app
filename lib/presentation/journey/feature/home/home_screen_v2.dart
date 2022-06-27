import 'dart:async';
import 'package:dsvm_app/common/navigation/route_names.dart';
import 'package:dsvm_app/presentation/journey/feature/home/suggest_today/suggest_today.dart';
import 'package:dsvm_app/presentation/journey/feature/home/suggest_today/widget/grid_view_product.dart';
import 'package:dsvm_app/presentation/journey/feature/home/suggest_today/widget/list_view_product.dart';
import 'package:dsvm_app/presentation/journey/feature/home/widget/home_appbar.dart';
import 'package:dsvm_app/presentation/widgets/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/argument/argument.dart';
import '../../../routes.dart';
import '../../../themes/theme_color.dart';

class HomeScreenV2 extends StatefulWidget {
  @override
  _HomeScreenV2State createState() => _HomeScreenV2State();
}

class _HomeScreenV2State extends State<HomeScreenV2> {
  ScrollController _scrollController = ScrollController();
  bool _getProductCategory = true;
  Completer<void> _refreshCompleter = Completer();

  /// tránh thường hợp hàm check bị lặp lại nhiều làn( vì onresume màn education_home bị
  /// call nhiều lần khi tắt dialog
  bool _logedOut = false;

  /// chỉ cho phép lock khi app đã chạy background sau đó vào lại foreground
  bool _enableLock = false;

  @override
  void initState() {
    //_scrollController.addListener(_scrollListener);
    _requestCallPermission();
    super.initState();
  }

  void _requestCallPermission() async {
    // if (!_globalAppCatch.haveLoggedIn) {
    //   return;
    // }
    // bool? showRequestCallPermission = await injector<LocalApp>()
    //     .getDataFromLocal(KeySaveLocalConstant.agreePolicyDeposit);
    // if (showRequestCallPermission == null &&
    //     injector<GlobalAppCache>().haveLoggedIn) {
    //   CommonUtil.showAlertDialog(
    //     context,
    //     message: translate(CallConst.requestPermissionCall),
    //     textOk: StringConst.continueText,
    //     title: translate(CallConst.titlePermissionCall),
    //     onOk: () async {
    //       await PermissionUtil.requestPermission(Permission.microphone);
    //       await injector<LocalApp>()
    //           .saveDataToLocal(KeySaveLocalConstant.agreePolicyDeposit, true);
    //     },
    //     onCancel: () {},
    //     showCancel: true,
    //   );
    // }
  }

  // void _scrollListener() {
  //   if (_scrollController.position.extentBefore >= 400 && _getProductCategory) {
  //     _getProductCategory = false;
  //     // _homeBloc.add(GetDataThreeCategoryEvent());
  //   }
  // }

  Future _startSearch() async {
    // await Routes.instance.navigateTo(RouteName.searchProductScreen,
    //     arguments: ArgumentSearchProductScreen(
    //       markerHomes: injector<HomeMapBloc>().allMarkerModel,
    //     ));
  }

  // void _onItemProductTap(ProductModel? item) {
  //   // Routes.instance.navigateTo(RouteName.detailProductScreen,
  //   //     arguments: ArgumentDetailProductScreen(
  //   //       item?.iD,
  //   //       customerId1: item?.customerId1,
  //   //     ));
  // }

  void _seeAllProducts(int? categoryId, String? categoryName) {
    // Routes.instance.navigateTo(RouteName.categoryDetailScreen,
    //     arguments: ArgumentCategoryDetailScreen(
    //         title: categoryName, categoryId: categoryId));
  }

  Future _onRefresh() async {
    //_makeRefreshData(showLoading: true);
    return _refreshCompleter.future;
  }

  // void _makeRefreshData({bool showLoading = false}) {
  //   _scrollController.animateTo(
  //     0.0,
  //     curve: Curves.easeOut,
  //     duration: const Duration(milliseconds: 300),
  //   );
  //   injector<GlobalAppCache>().reloadData = true;
  //   injector<HomeMapBloc>().onGetMarker(HomeMapGetMarkerEvent(
  //     isLocal: false,
  //     showLoading: showLoading,
  //   ));
  //   _homeBloc.add(GetDataFirstWhenGoToHomeEvent(
  //     fefreshData: true,
  //     showLoading: showLoading,
  //   ));
  //   _getProductCategory = true;
  // }

  // void _checkUserMoveToOtherLocation() async {
  //   injector<JobsCubit>().onGetLocationHighApp();
  // }

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomRefreshIndicator(
        onRefresh: _onRefresh,
        child: Column(
          children: [
            HomeAppBar(
              startSearch: _startSearch,
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                controller: _scrollController,
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      LayoutDisplayRandomListProduct(
                        data: oldModels,
                        labelTop: "Sản phẩm HOT",
                        onTapSeeAll: (_, title) {
                          Routes.instance.navigateTo(RouteName.allProductScreen,
                              arguments: ArgumentAllProductCommon(
                                  title: title,
                                  url: 'productapp/GetBestBuyNew?'));
                        },
                        onItemtap: (value) {
                          Routes.instance
                              .navigateTo(RouteName.detailProductScreen);
                        },
                      ),
                      LayoutDisplayRandomListProduct(
                        data: oldModels,
                        labelTop: "Sản phẩm mới",
                        onTapSeeAll: (_, title) {
                          Routes.instance.navigateTo(RouteName.allProductScreen,
                              arguments: ArgumentAllProductCommon(
                                  title: title,
                                  url: 'productapp/GetBestBuyNew?'));
                        },
                        onItemtap: (value) {
                          Routes.instance
                              .navigateTo(RouteName.detailProductScreen);
                        },
                      ),
                      SuggestToday(scrollController: _scrollController)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
