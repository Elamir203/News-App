import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Widgets/app_bar_widget.dart';

class WebViewPage extends StatefulWidget {
  WebViewPage({super.key, required this.url});

  final String url;

  @override
  State<WebViewPage> createState() => _WebViewAppState();
}


class _WebViewAppState extends State<WebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
