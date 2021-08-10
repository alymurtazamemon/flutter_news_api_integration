import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_api_integration/global-widgets/appbar.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {
  final String url;

  WebViewWidget({required this.url});

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GlobalAppBar(
          leadingIcon: Icons.arrow_back,
          onLeadingTap: () {
            Navigator.pop(context);
            FocusScope.of(context).unfocus();
          },
        ),
        body: WebView(
          initialUrl: url,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
