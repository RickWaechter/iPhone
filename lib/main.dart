import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'src/menu.dart';
import 'src/navigation_controls.dart';
import 'src/web_view_stack.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://www.localfood.bio'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewStack(controller: controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Hier wird der Cache gelöscht
          controller.clearCache();
        },
        child: Icon(Icons.delete), // Hier kannst du ein anderes Icon verwenden
      ),
    );
  }
}
