import 'package:flutter/cupertino.dart';

class SearchProvider extends ChangeNotifier {
  String url = "";

  void setUrl(String value) {
    url = value;
  }
}
