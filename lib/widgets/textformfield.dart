import 'package:flutter/material.dart';

class EditTextUtils {
  TextFormField getCustomEditTextArea(
      {String labelValue = "",
        String hintValue = "",
        bool? validation,
        Function? ontap,
        IconData? icon,
        int? maxline,
        int? maxLength,
        TextEditingController? controller,
        TextInputType keyboardType = TextInputType.text,
        TextStyle? textStyle,
        String? validationErrorMsg,
        Future<Null> Function()? onTap, }) {
    TextFormField textFormField = TextFormField(
      keyboardType: keyboardType,
      style: textStyle,
      controller: controller,
      maxLength: maxLength,
      validator: (String? value) {
        if (validation!) {
          if (value!.isEmpty) {
            return validationErrorMsg;
          }
        }
      },
      onTap:onTap,
      maxLines: maxline,
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
          labelText: labelValue,
          hintText: hintValue,
          labelStyle: textStyle,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
    return textFormField;
  }
}