import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';

import '../../../../common/argument/argument.dart';
import '../home/suggest_today/widget/grid_view_product.dart';

class AllProductScreen extends StatefulWidget {
  final ArgumentAllProductCommon? argument;
  const AllProductScreen({Key? key, this.argument}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  ScrollController _controller = ScrollController();
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
      appBar: AppBar(
        title: Text(widget.argument?.title ??""),
        backgroundColor: AppColors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OldGridview(
              models: oldModels,
              controller: _controller,
              backgroundColor: AppColors.white,
            )
          ],
        ),

      ),
    );
  }
}
