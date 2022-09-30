import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mwinproject/Screens/HomePage/Components/Appbar.dart';
import 'package:mwinproject/Screens/HomePage/Components/HomepageBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar(),
        body: const TabBarView(
          children: [
            HomePageBody(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
