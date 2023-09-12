import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocers/constants/colour.dart';
import 'package:grocers/views/ReuseWidgets/customTextField.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late DateTime pickedDate = DateTime.now();

  // void initState() {
  //   super.initState();
  //   pickedDate = _pickDate() ;
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: mainBckgrnd,
        leading: GestureDetector(
          onTap: () => Get.back(),
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
                    labelText: "First Name",
                    placeholder: "",
                    isPasswordTextField: false),
                const ReuseTextField(
                    labelText: "Last Name",
                    placeholder: "",
                    isPasswordTextField: false),
                const ReuseTextField(
                    labelText: "Email",
                    placeholder: "",
                    isPasswordTextField: false),
                const Text(
                  'Gender',
                  style: TextStyle(
                      color: textIcons,
                      fontFamily: 'ADLaMDisplay',
                      fontSize: 16),
                ),
                const DropDownGender(),
                const Text(
                  'Date of Birth',
                  style: TextStyle(
                      color: textIcons,
                      fontFamily: 'ADLaMDisplay',
                      fontSize: 16),
                ),
                ListTile(
                  textColor: textIcons,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(CupertinoIcons.calendar),
                  onTap: _pickDate,
                ),
                const Divider(
                  thickness: 2,
                  color: textIcons,
                ),
                // Expanded(
                //   child: Align(
                //     alignment: Alignment.bottomCenter,
                //     child: ElevatedButton(
                //         onPressed: () {},
                //         style: ElevatedButton.styleFrom(
                //             fixedSize: Size(width * 0.9, height * 0.065),
                //             backgroundColor: mainBckgrnd,
                //             elevation: 0,
                //             shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(25))),
                //         child: const Text(
                //           'Explore Products',
                //           style: TextStyle(
                //             fontSize: 22,
                //             fontFamily: 'ADLaMDisplay',
                //           ),
                //         )),
                //   ),
                // )
              ],
            )),
      ),
      bottomNavigationBar: Material(
        color: nuetralBck,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: textIcons.withOpacity(0.7))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () => Get.toNamed('/addAddress'),
              child: Container(
                decoration: const BoxDecoration(
                  color: mainBckgrnd,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  // border: Border.all(color: blackclr.withOpacity(0.5))
                ),
                height: height*0.06,
                width: double.infinity,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontFamily: 'ADLaMDisplay',
                      fontSize: 20,
                      color: nuetralBck,
                    ),
                  ),
                ),
              ),
            ),
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
}

class DropDownGender extends StatefulWidget {
  const DropDownGender({super.key});

  @override
  State<DropDownGender> createState() => _DropDownGenderState();
}

class _DropDownGenderState extends State<DropDownGender> {
  String selectedValue = 'Male';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      borderRadius: BorderRadius.circular(5),
      value: selectedValue,
      items: const [
        DropdownMenuItem(
          value: "Male",
          child: Text('Male'),
        ),
        DropdownMenuItem(
          value: "Female",
          child: Text('Female'),
        ),
        DropdownMenuItem(
          value: "Others",
          child: Text('Others'),
        ),
        DropdownMenuItem(
          value: "Unspecified",
          child: Text('Unspecified'),
        ),
      ],
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      style: const TextStyle(color: textIcons, fontSize: 16),
      padding: const EdgeInsets.only(bottom: 30),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: textIcons, width: 2, style: BorderStyle.solid)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: mainBckgrnd, width: 2, style: BorderStyle.solid)),
        errorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: redclr, width: 2, style: BorderStyle.solid)),
      ),
    );
  }
}
