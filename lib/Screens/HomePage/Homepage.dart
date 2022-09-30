import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: appBar(),
      body: const HomePageBody(),
    );
  }
}
