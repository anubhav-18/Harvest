import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/common_widgets/customTextField.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController recivernameController = TextEditingController();
    TextEditingController addressline1Controller = TextEditingController();
    TextEditingController addressline2Controller = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    TextEditingController landmarkController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: mainBckgrnd,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
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
              ReuseTextField(
                controller: recivernameController,
                  labelText: "Receiver's Name",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                controller: addressline1Controller,
                  labelText: "Address Line 1",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                controller: addressline2Controller,
                  labelText: "Address Line 2",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                controller: landmarkController,
                  labelText: "Landmark",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                controller: pincodeController,
                  labelText: "Pincode",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                controller: cityController,
                  labelText: "City",
                  placeholder: "",
                  isPasswordTextField: false),
              ReuseTextField(
                controller: stateController,
                  labelText: "State",
                  placeholder: "",
                  isPasswordTextField: false),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      Navigator.pushNamed(context, '/btmNav');
                      // Get.toNamed('/btmNav');
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
