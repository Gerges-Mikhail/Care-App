import 'package:care/common/common.dart';
import 'package:flutter/material.dart';

class MediaContainer extends StatelessWidget{
  final String icon;

  const MediaContainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Image.asset(icon,height: 40,),
    );
  }

}