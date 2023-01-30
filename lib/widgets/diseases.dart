import 'package:care/common/common.dart';
import 'package:care/widgets/checkbox.dart';
import 'package:flutter/material.dart';

class Diseases extends StatelessWidget {
  final String text;
  Diseases({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CheckBox(),
        Text(
          text,
          style: TextStyle(
              fontSize: 18, color: darkblue),
        ),
      ],);
  }
}
