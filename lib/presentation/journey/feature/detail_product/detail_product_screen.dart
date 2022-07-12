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
                          "Tên sản phẩm dài vãi đái cần xuống dòng nên viết nhiều 1 tý",
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
                          "Giá: 50.000 VND (1 túi-500g)",
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
                              "Thuộc vùng: ",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                                color: AppColors.grey7
                              ),
                            ),
                            Expanded(child: Text(
                              "Đồng bằng Sông Hồng",
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
                              "Tỉnh: ",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey7
                              ),
                            ),
                            Expanded(child: Text(
                              "Hải Dương",
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
                              "Mô tả sản phẩm:",
                              style: AppTextTheme.normal.copyWith(
                                  fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Thành phần: Bột ngũ cốc nguyên chất Hải Dung được chế biến từ 6 loại đậu tươi ngon nhất của vùng đất Hải Dương gồm: Đậu xanh, đậu đen, đậu đỏ, đậu trắng, gạo lứt, hạt sen.\n  Sản xuất tại: Cơ sở bánh đậu xanh Hải Dung, OCOP 4 sao tỉnh Hải Dương\nĐóng gói: Hộp 500g (gồm 10 túi 50g) thuận tiện cho việc bảo quản, sử dụng lâu dài\n  Công dụng: Bột ngũ cốc Hải Dung dùng cho mọi đối tượng, phụ nữ trước và sau sinh, người già, người táo bón, mất ngủ và trẻ em trên 2 tuổi.\n  Bổ sung chất xơ cần thiết, giúp mát gan, thanh nhiệt giải độc"
                            )

                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      LayoutDisplayRandomListProduct(
                        data: listModel,
                        labelTop: "Có thể bạn quan tâm",
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
                        labelTop: "Có thể bạn không quan tâm",
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
