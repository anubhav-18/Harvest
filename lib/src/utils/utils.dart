import 'package:flutter/material.dart';
import 'package:grocers/src/constants/colour.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content, style: const TextStyle(fontSize: 18,color: nuetralBck,fontWeight: FontWeight.bold),),
      elevation: 8,
      margin: const EdgeInsets.all(10),
      behavior: SnackBarBehavior.floating,
      backgroundColor: textIcons,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      duration: const Duration(milliseconds: 2000),
    ),
  );
}
