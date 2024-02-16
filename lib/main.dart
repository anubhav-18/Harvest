import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocers/firebase_options.dart';
import 'package:grocers/src/features/screens/Address_view/add_new_address.dart';
import 'package:grocers/src/features/screens/Address_view/saved_address.dart';
import 'package:grocers/src/features/screens/Address_view/userCheckLocation.dart';
import 'package:grocers/src/features/screens/cart_view/cart_page.dart';
import 'package:grocers/src/features/screens/home_view/BtmNav/btm_nav.dart';
import 'package:grocers/src/features/screens/home_view/home.dart';
import 'package:grocers/src/features/screens/login_view/first_time_login_info.dart';
import 'package:grocers/src/features/screens/login_view/loginpage.dart';
import 'package:grocers/src/features/screens/order_view/orderPage.dart';
import 'package:grocers/src/features/screens/profile_view/edit_profile.dart';
import 'package:grocers/src/features/screens/profile_view/profile_dashboard.dart';
import 'package:grocers/src/features/screens/splashscreen_view/splashscreen.dart';
import 'package:grocers/src/features/screens/wishList_view/wishList.dart';
import 'package:grocers/src/provider/address_provider.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:grocers/src/provider/location_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
      ],
      builder: (context, child) {
        return MaterialApp(
          home: const SplashScreen(),
          theme: ThemeData(
            fontFamily: 'Nunito',
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          title: 'Harvest',
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/homePage': (context) => const HomePage(),
            '/loginPage': (context) => const LoginPage(),
            '/profilePage': (context) => const ProfileDash(),
            '/editProfile': (context) => const EditProfile(),
            '/btmNav': (context) => const BtmNavBar(),
            '/addAddress': (context) => const AddNewAddress(),
            '/savedAddress': (context) => const SavedAddress(),
            '/wishlistPage': (context) => const WishList(),
            '/orderPage': (context) => const MyOrders(),
            '/cartPage': (context) => const CartPage(),
            '/FirstTimeLoginPage': (context) => const FirstTimeLoginInfo(),
            '/userCheckLoc': (context) => const UserCheckLoc(),
          },
        );
      },
    );
  }
}
