import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/constants/defaultPadding.dart';
import 'package:grocers/src/features/authentication/screens/login_view/otp_view.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // final controller = Get.put(PhoneNumberController());
  final phoneController = TextEditingController();
  final auth = FirebaseAuth.instance;

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => Get.toNamed('/btmNav'),
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                        color: mainBckgrnd,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Sign in',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'ADLaMDisplay',
                      color: textIcons,
                      fontWeight: FontWeight.w700)),
              const Text('To Harvest',
                  style: TextStyle(
                      fontSize: 36,
                      fontFamily: 'ADLaMDisplay',
                      color: textIcons,
                      fontWeight: FontWeight.w700)),
              const Text('to access your Addressess, Order & Wishlist.',
                  style: TextStyle(
                      fontSize: 17,
                      color: textIcons,
                      fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Column(children: [
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        prefixIcon: Text('+91 - ',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: 'ADLaMDisplay',
                              color: textIcons,
                            )),
                        prefixIconConstraints:
                            BoxConstraints(minHeight: 0, minWidth: 0),
                        hintText: 'Enter your Phone Number',
                        hintStyle: TextStyle(fontFamily: 'ADLaMDisplay')),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        auth.verifyPhoneNumber(
                            phoneNumber: phoneController.text,
                            verificationCompleted: (_) {},
                            verificationFailed: (e) {
                              if (e.code == 'invalid-phone-number') {
                                Get.snackbar('Error',
                                    'The Provide Phone Number is not Valid.',
                                    snackPosition: SnackPosition.BOTTOM,
                                    forwardAnimationCurve: Curves.elasticInOut,
                                    reverseAnimationCurve: Curves.easeOut,
                                    backgroundColor: redclr,
                                    colorText: whiteclr,
                                    margin: kDefaultPadding);
                              } else {
                                Get.snackbar(
                                    'Error', 'An unknown Error is occured',
                                    snackPosition: SnackPosition.BOTTOM,
                                    forwardAnimationCurve: Curves.elasticInOut,
                                    reverseAnimationCurve: Curves.easeOut,
                                    backgroundColor: redclr,
                                    colorText: whiteclr,
                                    margin: kDefaultPadding);
                              }
                            },
                            codeSent: ((verificationId, token) {
                              // Get.to(const OTPScreen(verificationId: verificationId,));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OTPScreen(
                                            verificationId: verificationId,
                                          )));
                            }),
                            codeAutoRetrievalTimeout: (e) {
                              Get.snackbar('Error', 'Unknown Error',
                                  snackPosition: SnackPosition.BOTTOM,
                                  forwardAnimationCurve: Curves.elasticInOut,
                                  reverseAnimationCurve: Curves.easeOut,
                                  backgroundColor: redclr,
                                  colorText: whiteclr,
                                  margin: kDefaultPadding);
                            });
                        // if (_formKey.currentState!.validate()) {
                        //   PhoneNumberController.Instance.phoneAuthentication(
                        //       controller.phoneNo.text.trim());
                        //   Get.toNamed('/otpPage');
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainBckgrnd,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        'Get OTP',
                        style: TextStyle(
                            fontSize: 20,
                            color: textIcons,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
