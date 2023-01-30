import 'package:care/common/common.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget{
  final String name;

  const Contact({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        color: darkblue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(child: Text(name,style: TextStyle(color: white,fontSize: 15),)),
    );
  }

}