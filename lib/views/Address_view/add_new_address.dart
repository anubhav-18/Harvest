import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';
import 'package:grocers/views/ReuseWidgets/customTextField.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: mainBckgrnd,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: nuetralBck,
          ),
        ),
        title: const Text(
          'New Address',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(height: 20),
              const ReuseTextField(
                  labelText: "Receiver's Name",
                  placeholder: "",
                  isPasswordTextField: false),
              const ReuseTextField(
                  labelText: "Address Line 1",
                  placeholder: "",
                  isPasswordTextField: false),
              const ReuseTextField(
                  labelText: "Address Line 2",
                  placeholder: "",
                  isPasswordTextField: false),
              const ReuseTextField(
                  labelText: "Landmark",
                  placeholder: "",
                  isPasswordTextField: false),
              const ReuseTextField(
                  labelText: "Pincode",
                  placeholder: "",
                  isPasswordTextField: false),
              const ReuseTextField(
                  labelText: "City",
                  placeholder: "",
                  isPasswordTextField: false),
              const ReuseTextField(
                  labelText: "State",
                  placeholder: "",
                  isPasswordTextField: false),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: nuetralBck,
                        side: const BorderSide(color: blackclr),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Cancel",
                        style: TextStyle(
                          fontSize: 18,
                          color: textIcons,
                          fontFamily: 'ADLaMDisplay',
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/btmNav');
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainBckgrnd,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Save",
                        style: TextStyle(
                          fontSize: 18,
                          color: nuetralBck,
                          fontFamily: 'ADLaMDisplay',
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Widget buildTextField(
//     String labelText, String placeholder, bool isPasswordTextField) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 30),
//     child: TextFormField(
//       decoration: InputDecoration(
//           suffixIcon: isPasswordTextField
//               ? IconButton(
//                   icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
//                   onPressed: () {})
//               : null,
//           contentPadding: const EdgeInsets.only(bottom: 5),
//           labelText: labelText,
//           labelStyle: const TextStyle(
//               color: textIcons, fontWeight: FontWeight.bold, fontSize: 21),
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           hintText: placeholder,
//           hintStyle: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.grey,
//           )),
//     ),
//   );
// }
