import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/firebase_options.dart';
import 'package:grocers/src/features/authentication/screens/Address_view/add_new_address.dart';
import 'package:grocers/src/features/authentication/screens/Address_view/saved_address.dart';
import 'package:grocers/src/features/authentication/screens/cart_view/cart_page.dart';
import 'package:grocers/src/features/authentication/screens/home_view/BtmNav/btm_nav.dart';
import 'package:grocers/src/features/authentication/screens/home_view/home.dart';
import 'package:grocers/src/features/authentication/screens/login_view/loginpage.dart';
import 'package:grocers/src/features/authentication/screens/login_view/otp_view.dart';
import 'package:grocers/src/features/authentication/screens/order_view/orderPage.dart';
import 'package:grocers/src/features/authentication/screens/profile_view/edit_profile.dart';
import 'package:grocers/src/features/authentication/screens/profile_view/profile_dashboard.dart';
import 'package:grocers/src/features/authentication/screens/splashscreen_view/splashscreen.dart';
import 'package:grocers/src/features/authentication/screens/wishList_view/wishList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      // .then((value) => Get.put(AuthenticationRepository()));
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
          page: () => LoginPage(),
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
        GetPage(name: '/cartPage', page: () => const CartPage()),
      ],
    );
  }
}
