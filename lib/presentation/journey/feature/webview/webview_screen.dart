import 'package:dsvm_app/presentation/journey/feature/webview/web_view_stack.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../common/constants/string_constants.dart';
import '../../../themes/theme_color.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/custom_scaffold.dart';
import 'menu.dart';
import 'navigation_controls.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: AppBar(
        backgroundColor: AppColors.green,
        leading: IconButton(
          icon: Icon(
            Icons.reply_all,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller), // Add this line
        ],
      ),
      body: WebViewStack(
        controller: controller,
      ),
    );
  }
}
