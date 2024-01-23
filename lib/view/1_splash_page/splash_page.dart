import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:notes_app/view/2_home_screen/home_screen.dart';

class Splash_Page extends StatefulWidget {
  const Splash_Page({super.key});

  @override
  State<Splash_Page> createState() => _Splash_PageState();
}

class _Splash_PageState extends State<Splash_Page> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Get.to(Home_Screen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/Animation - 1705660243960.json'),
      ),
    );
  }
}
