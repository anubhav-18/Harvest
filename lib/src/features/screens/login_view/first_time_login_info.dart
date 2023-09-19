import 'package:flutter/cupertino.dart';
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
  // final genderController = TextEditingController();
  // final dobController = TextEditingController();

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
      // body: SafeArea(
      //   child: Container(
      //     margin: kDefaultPadding,
      //     child: Column(
      //       children: [
      //         const Text(
      //           'Please provide us with some Information about you',
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //               fontSize: 18, color: blackclr, fontWeight: FontWeight.bold),
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         ReuseTextField(
      //           labelText: 'First Name',
      //           placeholder: '',
      //           isPasswordTextField: false,
      //           controller: firstNameController,
      //         ),
      //         ReuseTextField(
      //           labelText: 'Last Name',
      //           placeholder: '',
      //           isPasswordTextField: false,
      //           controller: lastNameController,
      //         ),
      //         ReuseTextField(
      //           labelText: 'Email Address',
      //           placeholder: '',
      //           isPasswordTextField: false,
      //           controller: emailController,
      //         ),
      //         const Expanded(
      //           child: Align(
      //             alignment: Alignment.bottomCenter,
      //           ),
      //         ),
      //         // SizedBox(
      //         //   width: double.infinity,
      //         //   height: 50,
      //         //   child: ElevatedButton(
      //         //     onPressed: () => storeData(),
      //         //     style: ElevatedButton.styleFrom(
      //         //         backgroundColor: mainBckgrnd,
      //         //         shape: RoundedRectangleBorder(
      //         //             borderRadius: BorderRadius.circular(30))),
      //         //     child: isLoading == true
      //         //         ? const Center(
      //         //             child: CircularProgressIndicator(),
      //         //           )
      //         //         : const Text('Save',
      //         //             style: TextStyle(
      //         //               fontSize: 25,
      //         //               color: textIcons,
      //         //               fontFamily: 'ADLaMDisplay',
      //         //             )),
      //         //   ),
      //         // )
      //       ],
      //     ),
      //   ),
      // ),
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
            //   const Text(
            //     'Gender',
            //     style: TextStyle(
            //         color: textIcons,
            //         fontFamily: 'ADLaMDisplay',
            //         fontWeight: FontWeight.bold,
            //         fontSize: 17),
            //   ),
            //   const DropDownGender(),
            //   const Text(
            //     'Date of Birth',
            //     style: TextStyle(
            //         color: textIcons,
            //         fontFamily: 'ADLaMDisplay',
            //         fontWeight: FontWeight.bold,
            //         fontSize: 17),
            //   ),
            //   ListTile(
            //     textColor: textIcons,
            //     contentPadding: EdgeInsets.zero,
            //     title: Text(
            //       "${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}",
            //       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //     trailing: const Icon(CupertinoIcons.calendar),
            //     onTap: _pickDate,
            //   ),
            //   const Divider(
            //     thickness: 2,
            //     color: textIcons,
            //   ),
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
                    : const Text('Save',
                        style: TextStyle(
                        fontFamily: 'ADLaMDisplay',
                        fontSize: 22,
                        color: nuetralBck,
                      ),),
              ),
            ),
            // GestureDetector(
            //   onTap: () => storeData(),
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       color: mainBckgrnd,
            //       borderRadius: BorderRadius.all(Radius.circular(25)),
            //       // border: Border.all(color: blackclr.withOpacity(0.5))
            //     ),
            //     height: MediaQuery.of(context).size.height * 0.06,
            //     width: double.infinity,
            //     child: const Align(
            //       alignment: Alignment.center,
            //       child: Text(
            //         'Save',
            //         style: TextStyle(
            //           fontFamily: 'ADLaMDisplay',
            //           fontSize: 20,
            //           color: nuetralBck,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
      ),
    );
    
  }
  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime(2024),
      initialDate: pickedDate,
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        // gender: genderController.text.trim(),
        // dob: dobController.text.trim(),
        uid: "",
        phoneNo: "",
        createdAt: "",
        );
    if (firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty && emailController.text.trim().isNotEmpty) {
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
      showSnackBar(context, 'Enter Your First & Last Name & E-Mail');
    }
  }
}

// class DropDownGender extends StatefulWidget {
//   const DropDownGender({super.key});

//   @override
//   State<DropDownGender> createState() => _DropDownGenderState();
// }
// class _DropDownGenderState extends State<DropDownGender> {
//   String selectedValue = 'Male';
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField(
//       borderRadius: BorderRadius.circular(5),
//       value: selectedValue,
//       items: const [
//         DropdownMenuItem(
//           value: "Male",
//           child: Text('Male'),
//         ),
//         DropdownMenuItem(
//           value: "Female",
//           child: Text('Female'),
//         ),
//         DropdownMenuItem(
//           value: "Others",
//           child: Text('Others'),
//         ),
//         DropdownMenuItem(
//           value: "Unspecified",
//           child: Text('Unspecified'),
//         ),
//       ],
//       onChanged: (String? newValue) {
//         setState(() {
//           selectedValue = newValue!;
//         });
//       },
//       style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       padding: const EdgeInsets.only(bottom: 30),
//       decoration: const InputDecoration(
//         enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//                 color: textIcons, width: 2, style: BorderStyle.solid)),
//         focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//                 color: mainBckgrnd, width: 2, style: BorderStyle.solid)),
//         errorBorder: UnderlineInputBorder(
//             borderSide:
//                 BorderSide(color: redclr, width: 2, style: BorderStyle.solid)),
//       ),
//     );
//   }
// }
