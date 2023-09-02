import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocers/views/Address_view/add_new_address.dart';
import 'package:grocers/views/Address_view/saved_address.dart';
import 'package:grocers/views/home_view/BtmNav/btm_nav.dart';
import 'package:grocers/views/home_view/home.dart';
import 'package:grocers/views/login_view/loginpage.dart';
import 'package:grocers/views/login_view/otp_view.dart';
import 'package:grocers/views/order_view/orderPage.dart';
import 'package:grocers/views/profile_view/edit_profile.dart';
import 'package:grocers/views/profile_view/profile_dashboard.dart';
import 'package:grocers/views/splashscreen_view/splashscreen.dart';
import 'package:grocers/views/wishList_view/wishList.dart';

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
      home: const SplashScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/homePage', page: () => const HomePage()),
        GetPage(
          name: '/loginPage',
          page: () => const LoginPage(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        ),
        GetPage(
          name: '/otpPage',
          page: () => const OTPScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        ),
        GetPage(
          name: '/profilePage',
          page: (() => const ProfileDash()),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        ),
        GetPage(
          name: '/editProfile', 
          page: () => const EditProfile(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        ),
        GetPage(name: '/btmNav', page: () => const BtmNavBar()),
        GetPage(name: '/addAddress', page: () => const AddNewAddress()),
        GetPage(name: '/savedAddress', page: () => const SavedAddress()),
        GetPage(name: '/wishlistPage', page: () => const WishList()),
        GetPage(name: '/orderPage', page: () => const MyOrders()),  
      ],
    );
  }
}
