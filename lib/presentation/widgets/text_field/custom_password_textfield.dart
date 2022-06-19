import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constants/icon_constant.dart';
import '../../../common/constants/string_constants.dart';
import '../../themes/theme_color.dart';
import '../../themes/theme_text.dart';
import '../custom_gesturedetector.dart';
import 'custom_text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isShow = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
