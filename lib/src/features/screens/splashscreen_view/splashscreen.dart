import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      final ap = Provider.of<AuthProvider>(context, listen: false);
      if (ap.isSignedIn == true) {
        ap.getDataFromSP().whenComplete(() =>
            Navigator.of(context).pushReplacementNamed('/btmNav'));
      } else {
        Navigator.of(context).pushReplacementNamed('/loginPage');
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: mainBckgrnd,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_rm_bck.png',
              ),
              const CircularProgressIndicator(color: whiteclr,),
              // Container(
              //   margin: const EdgeInsets.only(
              //     left: 20,
              //     right: 20,
              //     bottom: 15,
              //     top: 15,
              //   ),
              //   width: double.infinity,
              //   height: 50,
              //   child: CustomButton(
              //     text: 'Get Started',
              //     onPressed: () async {
              //       if (ap.isSignedIn == true) {
              //         await ap.getDataFromSP().whenComplete(() =>
              //             Navigator.of(context)
              //                 .pushReplacementNamed('/btmNav'));
              //       } else {
              //         Navigator.of(context).pushReplacementNamed('/loginPage');
              //       }
              //     },
              //   ),
              // ),            
            ],
          ),
        ),
      ),
    );
  }
}
