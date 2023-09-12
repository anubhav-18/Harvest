import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => Get.toNamed('/btmNav') ,
                  child: const Text('Skip' , style: TextStyle(color: mainBckgrnd,fontSize: 18, fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: 15,),
              const Text('Sign in', style: TextStyle(fontSize: 36 , fontFamily: 'ADLaMDisplay', color: textIcons , fontWeight: FontWeight.w700)),
              const Text('To Harvest',style: TextStyle(fontSize: 36 ,fontFamily: 'ADLaMDisplay', color: textIcons , fontWeight: FontWeight.w700)),
              const Text('to access your Addressess, Order & Wishlist.',style: TextStyle(fontSize: 17 , color: textIcons , fontWeight: FontWeight.w700)),
              const SizedBox(height: 100,),
              Expanded(
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    prefixIcon: Text('+91 - ', style: TextStyle(fontSize: 19 ,fontFamily: 'ADLaMDisplay', color: textIcons , )),
                    prefixIconConstraints: BoxConstraints(minHeight: 0,minWidth: 0),
                    // prefix: Text('+91 -',style: TextStyle(fontSize: 18 , color: Colors.black)),
                    hintText: 'Enter your Phone Number',
                    hintStyle: TextStyle(fontFamily: 'ADLaMDisplay')
                  ),
                  
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/otpPage'), 
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