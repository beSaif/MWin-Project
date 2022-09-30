import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mwinproject/Provider/SearchProvider.dart';
import 'package:provider/provider.dart';

class InAppWebViewBody extends StatefulWidget {
  const InAppWebViewBody({super.key});

  @override
  State<InAppWebViewBody> createState() => _InAppWebViewBodyState();
}

class _InAppWebViewBodyState extends State<InAppWebViewBody> {
  double _progress = 0;
  late InAppWebViewController webview;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Web Browser'),
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(searchProvider.url)),
              onWebViewCreated: (
                InAppWebViewController controller,
              ) {
                webview = controller;
              },
              onProgressChanged: (controller, progress) {
                setState(() {
                  _progress = progress / 100;
                });
              },
            ),
            _progress < 1
                ? SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                      value: _progress,
                    ))
                : SizedBox()
          ],
        ));
  }
}
