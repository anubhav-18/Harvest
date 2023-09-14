import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/constants/defaultPadding.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final verificationId;
  const OTPScreen({super.key, this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // final controller = Get.put(OTPcontroller());
  // var otp ;
  final phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: textIcons,
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Sign in ',
                    style: TextStyle(
                        fontSize: 18,
                        color: textIcons,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Verify Phone Number',
                      style: TextStyle(
                          color: textIcons,
                          fontFamily: 'ADLaMDisplay',
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'An SMS with 6-digit OTP was sent to',
                    style: TextStyle(
                        color: textIcons,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '+91 1234567891',
                    style: TextStyle(
                        color: textIcons,
                        fontFamily: 'ADLaMDisplay',
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Pinput(
                  autofocus: true,
                  length: 6,
                  controller: phonecontroller,
                  // onSubmitted: (code) {
                  //   otp = code ;
                  //   OTPcontroller.instance.verifyOtp(otp);
                  // },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => Get.back(),
                        child: const Text(
                          'Edit Phone Number ?',
                          style: TextStyle(
                              color: textIcons,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              const Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
              )),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      final credential = PhoneAuthProvider.credential(
                          verificationId: widget.verificationId,
                          smsCode: phonecontroller.text.toString());
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        Get.offAllNamed('/btmNav');
                      } catch (e) {
                        Get.snackbar('Error', '$e',
                            snackPosition: SnackPosition.BOTTOM,
                            forwardAnimationCurve: Curves.elasticInOut,
                            reverseAnimationCurve: Curves.easeOut,
                            backgroundColor: redclr,
                            colorText: whiteclr,
                            margin: kDefaultPadding);
                      }
                      // controller.verifyOtp(otp);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainBckgrnd,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text('Verify',
                        style: TextStyle(
                            fontSize: 20,
                            color: textIcons,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
