import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/item_product_type_one.dart';

class ListRandomProduct extends StatelessWidget {
  const ListRandomProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = (MediaQuery.of(context).size.width) / 1.55;
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                'Sản phẩm',
                style: AppTextTheme.mediumBlack,
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    EdgeInsets.only(left: 16, right: 12, top: 16, bottom: 12),
                child: Text(
                  StringConst.all,
                  style: AppTextTheme.normalBlue,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: height,
          child: ItemProductTypeOne(),
        )
      ],
    );
  }
}
