import 'package:flutter/material.dart';
import 'package:mwinproject/Provider/SearchProvider.dart';
import 'package:mwinproject/Screens/HomePage/Components/HomepageBody.dart';
import 'package:mwinproject/Screens/HomePage/Homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => SearchProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MWin Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
