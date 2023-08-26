import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';
import 'package:grocers/views/login_view.dart/otp_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          // padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {} ,
                  child: const Text('Skip' , style: TextStyle(color: mainBckgrnd,fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: 15,),
              const Row(
                children: [
                  Text('Sign in', style: TextStyle(fontSize: 36 , fontFamily: 'ADLaMDisplay', color: textIcons , fontWeight: FontWeight.w700)),
                ],
                ),
              const Row(
                children: [
                  Text('To Harvest',style: TextStyle(fontSize: 36 ,fontFamily: 'ADLaMDisplay', color: textIcons , fontWeight: FontWeight.w700)),
                ],
              ),
              const Row(
                children: [
                  Text('to access your Addressess, Order & Wishlist.',style: TextStyle(fontSize: 17 , color: textIcons , fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 70,),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Enter Your Phone Number',
                  hintStyle: TextStyle(fontWeight: FontWeight.bold)
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const OTPScreen());
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainBckgrnd,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                  ),
                  child: const Text('Get OTP', style: TextStyle(fontSize: 20 , color: textIcons , fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: 10,),              
            ],
          ),
        ),
      ),
    
    );
  }
}