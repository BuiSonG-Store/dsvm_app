import 'package:dsvm_app/common/constants/icon_constant.dart';
import 'package:dsvm_app/common/constants/images_const.dart';
import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/presentation/journey/feature/personal/widget/personal_item.dart';
import 'package:dsvm_app/presentation/journey/feature/webview/webview_screen.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/navigation/route_names.dart';
import '../../../routes.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  void _goToFb() {
    Routes.instance.navigateTo(
      RouteName.webViewScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.grey3,
      customAppBar: CustomAppBar(
        title: 'Cá nhân',
        showIconLeft: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ItemPersonal(
              onTap: () {},
              description: '0335950503',
              title: 'Bùi Nguyễn Nam Sơn',
              styleTitle: AppTextTheme.medium20PxBlack,
              styleDes:
                  AppTextTheme.normalBlack.copyWith(color: AppColors.grey7),
              icon: ImageConstant.logo,
              heightIcon: 50,
              widthIcon: 50,
            ),
            SizedBox(height: 8),
            ItemPersonal(
              icon: IconConst.location,
              onTap: () {},
              description: 'Quản lý địa chỉ giao hàng',
              title: 'Địa chỉ của tôi',
            ),
            SizedBox(height: 8),
            ItemPersonal(
              icon: IconConst.facebook,
              onTap: _goToFb,
              title: 'Fanpage Đặc Sản Vùng Miền Việt Nam',
              description: 'Facebook Fanpage chăm sóc khách hàng',
            ),
            ItemPersonal(
              icon: IconConst.map,
              onTap: () {},
              title: 'Địa chỉ các cửa hàng',
              description: 'Giúp bạn đến cửa hàng của chúng tôi dễ dàng',
            ),
            ItemPersonal(
              icon: IconConst.info,
              onTap: () {},
              title: 'Giới thiệu về chúng tôi',
              description: '',
              haveDes: false,
            ),
            ItemPersonal(
              icon: IconConst.info_app,
              onTap: () {},
              title: 'Thông tin ứng dụng',
              showIconRight: false,
              description: 'Đặc Sản Vùng Miền HHT - ${StringConst.versionApp} ',
            ),
            SizedBox(height: 8),
            ItemPersonal(
              icon: IconConst.logout,
              onTap: () {},
              title: 'Đăng xuất',
              description: '',
              haveDes: false,
            ),
          ],
        ),
      ),
    );
  }
}
