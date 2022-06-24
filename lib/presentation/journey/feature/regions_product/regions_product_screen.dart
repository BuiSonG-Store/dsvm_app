import 'package:dsvm_app/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/string_constants.dart';
import '../../../widgets/tab_view_bottom.dart';

class RegionsProductScreen extends StatelessWidget {
  const RegionsProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarWidget: CustomAppBar(
        title: 'Đặc sản theo vùng miền',
        showIconLeft: false,
      ),
      body: Expanded(
        child: TabViewBottom(
          haveDes: true,
          desTitle: '*Vuốt sang hoặc chọn tên vùng miền để xem sản phẩm',
          titleSize: 14.0,
          height: null,
          titlesTab: StringConst.listRegions,
          tabs: [
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
