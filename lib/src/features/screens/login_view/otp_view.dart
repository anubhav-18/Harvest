import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:grocers/src/utils/utils.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  final String phoneController;
  const OTPScreen({
    super.key,
    required this.verificationId,
    required this.phoneController ,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
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
                      onPressed: () => Navigator.of(context).pop(),
                      // Get.back(),
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
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: 
                  RichText(
                      text: TextSpan(
                          text: "+91 ${widget.phoneController}",
                          style: const TextStyle(
                              color: textIcons,
                              fontFamily: 'ADLaMDisplay',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          children: [
                        const WidgetSpan(
                            child: Padding(padding: EdgeInsets.all(6))),
                        TextSpan(
                            text: 'change',
                            style: const TextStyle(
                                color: mainBckgrnd, fontSize: 16),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context).pop())
                      ])),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Pinput(
                  autofocus: true,
                  showCursor: true,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: mainBckgrnd,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
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
                        onPressed: () {},
                        child: const Text(
                          'Resend Code ? ',
                          style: TextStyle(
                              color: textIcons,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              const Spacer(),
              // const Expanded(
              //     child: Align(
              //   alignment: Alignment.bottomCenter,
              // )),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (otpCode != null) {
                        verifyOtp(context, otpCode!);
                      } else {
                        showSnackBar(context, 'Enter 6-Digit Code');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainBckgrnd,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: nuetralBck,
                            ),
                          )
                        : const Text('Verify',
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

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
              ap.getDataFromFirestore().then((value) => ap
                  .saveUserDataToSP()
                  .then((value) => ap.setSignIn().then((value) =>
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/btmNav', (route) => false))));
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/FirstTimeLoginPage', (route) => false);
            }
          });
        });
  }
}
