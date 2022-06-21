import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../themes/theme_color.dart';

class WebViewStack extends StatefulWidget {
  String url;
  WebViewStack({required this.controller, required this.url, Key? key})
      : super(key: key);
  final Completer<WebViewController> controller; // Add this attribute

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {
  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onWebViewCreated: (webViewController) {
              widget.controller.complete(webViewController);
            },
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: _createJavascriptChannels(context),
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
              minHeight: 20,
              color: AppColors.green,
            ),
        ],
      ),
    );
  }

  Set<JavascriptChannel> _createJavascriptChannels(BuildContext context) {
    return {
      JavascriptChannel(
        name: 'SnackBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message.message)));
        },
      ),
    };
  }
}
