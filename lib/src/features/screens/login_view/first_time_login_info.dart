import 'package:flutter/material.dart';
import 'package:grocers/src/common_widgets/customTextField.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/constants/defaultPadding.dart';
import 'package:grocers/src/features/models/user_model.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:grocers/src/utils/utils.dart';
import 'package:provider/provider.dart';

class FirstTimeLoginInfo extends StatefulWidget {
  const FirstTimeLoginInfo({super.key});

  @override
  State<FirstTimeLoginInfo> createState() => _FirstTimeLoginInfoState();
}

class _FirstTimeLoginInfoState extends State<FirstTimeLoginInfo> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: mainBckgrnd,
        title: const Text(
          'Information',
          style: TextStyle(
            fontSize: 24,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: kDefaultPadding,
          child: Column(
            children: [
              const Text(
                'Please provide us with some Information about you',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, color: blackclr, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              ReuseTextField(
                labelText: 'First Name',
                placeholder: '',
                isPasswordTextField: false,
                controller: firstNameController,
              ),
              ReuseTextField(
                labelText: 'Last Name',
                placeholder: '',
                isPasswordTextField: false,
                controller: lastNameController,
              ),
              ReuseTextField(
                labelText: 'Email Address',
                placeholder: '',
                isPasswordTextField: false,
                controller: emailController,
              ),
              const Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
              )),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => storeData(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainBckgrnd,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Save',
                          style: TextStyle(
                            fontSize: 25,
                            color: textIcons,
                            fontFamily: 'ADLaMDisplay',
                          )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        uid: "",
        phoneNo: "",
        createdAt: "");
    if (firstNameController.text.trim().isNotEmpty ||
        lastNameController.text.trim().isNotEmpty) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                      (value) => Navigator.of(context)
                          .pushNamedAndRemoveUntil('/btmNav', (route) => false),
                    ),
              );
        },
      );
    } else {
      showSnackBar(context, 'Enter Your First and Last Name');
    }
  }
}
