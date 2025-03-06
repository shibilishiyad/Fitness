import 'package:fitness/screen/home.dart';
import 'package:fitness/utils/screen_util.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        ScreenUtil.init(context);

        return const Home();
      }),
    );
  }
}
