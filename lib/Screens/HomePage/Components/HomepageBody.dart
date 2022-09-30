import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mwinproject/Provider/SearchProvider.dart';
import 'package:mwinproject/Screens/HomePage/InAppWebView/Components/InAppWebViewBody.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    String url = searchProvider.url;
    return Center(
        child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                onChanged: (value) {
                  url = value;
                  searchProvider.setUrl(url);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (url == null || url.isEmpty) {
                    // code for snackbar here
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter a url'),
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const InAppWebViewBody())));
                  }
                },
                child: const Text("Search"))
          ],
        ),
      ],
    ));
  }
}
