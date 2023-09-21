import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';

class ReuseTextField extends StatelessWidget {
  final String labelText;
  final String placeholder;
  final bool isPasswordTextField;
  final TextEditingController controller ; 
  // final String initialValueText ; 
  const ReuseTextField(
      {super.key,
      required this.controller , 
      required this.labelText,
      required this.placeholder,
      required this.isPasswordTextField, 
      // this.initialValueText = ""
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,left: 20 ,right: 20 , top: 10),
      child: TextFormField(
        // initialValue: initialValueText,
        
        controller: controller,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: textIcons, width: 2, style: BorderStyle.solid)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: mainBckgrnd, width: 2, style: BorderStyle.solid)),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                    color: redclr, width: 2, style: BorderStyle.solid)),
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                    onPressed: () {})
                : null,
            contentPadding: const EdgeInsets.only(bottom: 8),
            labelText: labelText,
            labelStyle: const TextStyle(
                color: textIcons, fontFamily: 'ADLaMDisplay', fontSize: 22),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 18,
              fontFamily: 'ADLaMDisplay',
              color: Colors.grey,
            )),
      ),
    );
  }
}
