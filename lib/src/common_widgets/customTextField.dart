import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';

class ReuseTextField extends StatelessWidget {
  final String labelText;
  final String placeholder;
  final bool isPasswordTextField;
  final TextEditingController controller ; 
  const ReuseTextField(
      {super.key,
      required this.controller , 
      required this.labelText,
      required this.placeholder,
      required this.isPasswordTextField});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextFormField(
        controller: controller,
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
            contentPadding: const EdgeInsets.only(bottom: 5),
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
