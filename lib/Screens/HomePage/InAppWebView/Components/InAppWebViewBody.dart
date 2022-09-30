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

  arrowBack() async {
    if (await webview.canGoBack()) {
      webview.goBack();
    }
  }

  arrowForward() async {
    if (await webview.canGoForward()) {
      webview.goForward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
              searchProvider.setUrl("");
            },
          ),
          title: const Text('Web Browser'),
          actions: [
            IconButton(
                onPressed: arrowBack, icon: const Icon(Icons.arrow_back)),
            IconButton(
                onPressed: arrowForward, icon: const Icon(Icons.arrow_forward))
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  useShouldOverrideUrlLoading: true,
                ),
              ),
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                final uri = navigationAction.request.url!;
                if (searchProvider.url.contains(uri.host)) {
                  print("debug123 $uri");
                  return NavigationActionPolicy.ALLOW;
                }
                print("debug123 $uri");

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('You are not allowed to open this url'),
                  duration: Duration(seconds: 2),
                ));
                return NavigationActionPolicy.CANCEL;
              },
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
                : const SizedBox()
          ],
        ));
  }
}
