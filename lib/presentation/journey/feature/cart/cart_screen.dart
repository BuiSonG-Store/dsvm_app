import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/presentation/journey/feature/cart/widget/cart_empty.dart';
import 'package:dsvm_app/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: CustomAppBar(
        showIconLeft: false,
        title: StringConst.cart,
      ),
      body: CartEmpty(),
    );
  }
}
