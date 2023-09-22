import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:grocers/src/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneController.text.length));
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: 120,
              ),
              Expanded(
                child: Column(children: [
                  TextFormField(
                    cursorColor: textIcons,
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      setState(() {
                        phoneController.text = value;
                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: mainBckgrnd,
                              width: 2,
                              style: BorderStyle.solid)),
                      hintText: 'Enter your Phone Number',
                      prefixIcon: const Text('+91 - ',
                          style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'ADLaMDisplay',
                            color: textIcons,
                          )),
                      prefixIconConstraints:
                          const BoxConstraints(minHeight: 0, minWidth: 0),
                      suffixIcon: phoneController.text.length == 10
                          ? Container(
                              height: 30,
                              width: 30,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 20,
                              ),
                            )
                          : null,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () { 
                        if(phoneController.text.length == 10){
                          sendPhoneNo();
                        }
                        else {
                          showSnackBar(context, 'Enter an 10-Digit Phone Number');
                        }
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

  void sendPhoneNo() {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    ap.signInWithPhone(context, "+91$phoneNumber" , phoneController.text);
  }

}
