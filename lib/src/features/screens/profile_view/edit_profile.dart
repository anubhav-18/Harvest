import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';
import 'package:grocers/src/common_widgets/customTextField.dart';
import 'package:grocers/src/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late DateTime pickedDate = DateTime.now();
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    final ap = Provider.of<AuthProvider>(context, listen: false);
    firstNameController =
        TextEditingController(text: ap.userModel.firstName.capitalize());
    lastNameController =
        TextEditingController(text: ap.userModel.lastName.capitalize());
    emailController = TextEditingController(text: ap.userModel.email);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;

    firstNameController.selection = TextSelection.fromPosition(
        TextPosition(offset: firstNameController.text.length));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: mainBckgrnd,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: nuetralBck,
          ),
        ),
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 22,
            color: nuetralBck,
            fontFamily: 'ADLaMDisplay',
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            // ReuseTextField(
            //     // initialValueText: ap.userModel.email,
            //     controller: emailController,
            //     labelText: "Email",
            //     placeholder: "",
            //     isPasswordTextField: false),
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
            //       style: const TextStyle(
            //           fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //     trailing: const Icon(CupertinoIcons.calendar),
            //     onTap: _pickDate,
            //   ),
            //   const Divider(
            //     thickness: 2,
            //     color: textIcons,
            //   ),
            const Spacer(),
            Container(
              color: nuetralBck,
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: double.infinity,
                child: ElevatedButton(
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
                      : const Text(
                          'Save',
                          style: TextStyle(
                            fontFamily: 'ADLaMDisplay',
                            fontSize: 20,
                            color: nuetralBck,
                          ),
                        ),
                  onPressed: () {
                    ap
                        .updateDataProfileData(
                            context: context,
                            firstname: firstNameController.text.trim(),
                            lastname: lastNameController.text.trim(),
                            email: emailController.text.trim())
                        .then((value) => Navigator.of(context).pushNamed('/profilePage'));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // _pickDate() async {
  //   DateTime? date = await showDatePicker(
  //     context: context,
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(2024),
  //     initialDate: pickedDate,
  //   );
  //   if (date != null) {
  //     setState(() {
  //       pickedDate = date;
  //     });
  //   }
  // }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
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
