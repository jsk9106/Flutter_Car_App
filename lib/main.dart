import 'package:flutter/material.dart';
import 'package:flutter_car_app/constants.dart';
import 'package:flutter_car_app/screen/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Car App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: HomeScreen(),
    );
  }
}
