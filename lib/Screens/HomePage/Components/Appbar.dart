import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    title: const Text('MWin Project'),
    bottom: const TabBar(
      tabs: [
        Tab(icon: Icon(Icons.home)),
        Tab(icon: Icon(Icons.web)),
      ],
    ),
  );
}
