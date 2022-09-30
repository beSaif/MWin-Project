import 'package:flutter/material.dart';
import 'package:mwinproject/Screens/HomePage/InAppWebView/Components/InAppWebViewBody.dart';

class InAppWebView extends StatefulWidget {
  const InAppWebView({super.key});

  @override
  State<InAppWebView> createState() => _InAppWebViewState();
}

class _InAppWebViewState extends State<InAppWebView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: InAppWebViewBody(),
    );
  }
}
