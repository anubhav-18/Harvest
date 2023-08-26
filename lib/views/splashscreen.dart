import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const  Duration (seconds: 3), () => Get.offNamed('/loginPage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainBckgrnd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_rm_bck.png',),
            const SizedBox(height: 10,),
            const CircularProgressIndicator(color: Colors.white,)
          ],
        ),
      ),
    );
  }
}