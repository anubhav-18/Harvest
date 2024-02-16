import 'package:flutter/material.dart';
import 'package:grocers/src/common_widgets/customTextField.dart';
import 'package:grocers/src/constants/colour.dart';
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
  late DateTime pickedDate = DateTime.now();

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
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(height: 20),
              ReuseTextField(
                  // initialValueText: ap.userModel.firstName,
                  controller: firstNameController,
                  labelText: "First Name",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                  // initialValueText: ap.userModel.lastName,
                  controller: lastNameController,
                  labelText: "Last Name",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                  // initialValueText: ap.userModel.email,
                  controller: emailController,
                  labelText: "Email",
                  placeholder: "",
                  isPasswordTextField: false),
            ],
          )),
      bottomNavigationBar: Material(
        color: nuetralBck,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: textIcons.withOpacity(0.7))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
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
                    : const Text(
                        'Save',
                        style: TextStyle(
                          fontFamily: 'ADLaMDisplay',
                          fontSize: 22,
                          color: nuetralBck,
                        ),
                      ),
              ),
            ),
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
      createdAt: "",
    );
    if (firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => 
                ap.setSignIn().then(
                      (value) => 
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/btmNav', (route) => false),
                    ),
              );
          showSnackBar(context, 'Welcome to Harvest');
        },
      );
    } else {
      showSnackBar(context, 'Enter Your First & Last Name & E-Mail');
    }
  }
}
