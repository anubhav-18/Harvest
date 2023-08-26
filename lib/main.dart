import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocers/views/home.dart';
import 'package:grocers/views/login_view.dart/loginpage.dart';
import 'package:grocers/views/login_view.dart/otp_view.dart';
import 'package:grocers/views/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      title: 'Grocers',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/homePage', page: () => const HomePage()),
        GetPage(
          name: '/loginPage',
          page: () => const LoginPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 1000),
          curve: Curves.linear,
        ),
        GetPage(
          name: '/otpPage',
          page: () => const OTPScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        ),
      ],
    );
  }
}
