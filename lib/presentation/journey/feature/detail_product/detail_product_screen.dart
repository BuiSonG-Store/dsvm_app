import 'package:dsvm_app/common/constants/icon_constant.dart';
import 'package:dsvm_app/data/model/product_model.dart';
import 'package:dsvm_app/presentation/journey/feature/detail_product/widget/custom_sliver_appbar.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/argument/argument.dart';
import '../../../../common/navigation/route_names.dart';
import '../../../routes.dart';
import '../home/suggest_today/widget/grid_view_product.dart';
import '../home/suggest_today/widget/list_view_product.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {

  List<ProductModel> listModel =[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: DetailProductCustomSliverAppbar(
                  moveToCart: () {
                    Routes.instance.navigateTo(
                      RouteName.splashScreen,
                    );
                  },
                  onFavourite: (value) {},
                  onClose: () {
                    Routes.instance.pop();
                  },
                  onIconMoreTap: (value) {},
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "T??n s???n ph???m d??i v??i ????i c???n xu???ng d??ng n??n vi???t nhi???u 1 t??",
                          style: AppTextTheme.normal.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Gi??: 50.000 VND (1 t??i-500g)",
                          style: AppTextTheme.normal.copyWith(
                              fontWeight: FontWeight.w600,
                            color: AppColors.green
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.green),
                                borderRadius: BorderRadius.circular(4.0)
                              ),
                              padding: EdgeInsets.all(6.0),
                              child: SvgPicture.asset(IconConst.iconFavorite, color: AppColors.green),
                            ),

                            SizedBox(
                              width: 10,
                            ),
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.green,
                                  borderRadius: BorderRadius.circular(4.0)
                              ),
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(IconConst.iconShoppingCart, color: AppColors.white),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("Mua ngay", style: AppTextTheme.mediumBlack14px.copyWith(color: AppColors.white),)
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),

                      CustomDivider(),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              "Thu???c v??ng: ",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                                color: AppColors.grey7
                              ),
                            ),
                            Expanded(child: Text(
                              "?????ng b???ng S??ng H???ng",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green
                              ),
                            ))
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "T???nh: ",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey7
                              ),
                            ),
                            Expanded(child: Text(
                              "H???i D????ng",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.green
                              ),
                            ))
                          ],
                        ),
                      ),

                      CustomDivider(),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "M?? t??? s???n ph???m:",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Th??nh ph???n: B???t ng?? c???c nguy??n ch???t H???i Dung ???????c ch??? bi???n t??? 6 lo???i ?????u t????i ngon nh???t c???a v??ng ?????t H???i D????ng g???m: ?????u xanh, ?????u ??en, ?????u ?????, ?????u tr???ng, g???o l???t, h???t sen.\n  S???n xu???t t???i: C?? s??? b??nh ?????u xanh H???i Dung, OCOP 4 sao t???nh H???i D????ng\n????ng g??i: H???p 500g (g???m 10 t??i 50g) thu???n ti???n cho vi???c b???o qu???n, s??? d???ng l??u d??i\n  C??ng d???ng: B???t ng?? c???c H???i Dung d??ng cho m???i ?????i t?????ng, ph??? n??? tr?????c v?? sau sinh, ng?????i gi??, ng?????i t??o b??n, m???t ng??? v?? tr??? em tr??n 2 tu???i.\n  B??? sung ch???t x?? c???n thi???t, gi??p m??t gan, thanh nhi???t gi???i ?????c"
                            )

                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      LayoutDisplayRandomListProduct(
                        data: listModel,
                        labelTop: "C?? th??? b???n quan t??m",
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
                        data: listModel,
                        labelTop: "C?? th??? b???n kh??ng quan t??m",
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

                    ],
                  )
                ]),
              )
            ],
          )
        ],
      ),
    ));
  }
}
