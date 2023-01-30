
import 'package:care/common/common.dart';
import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget{
  final IconData icon;
  final String mainText;
  final double width;
  final double height;

  const MenuContainer({super.key, required this.icon, required this.mainText, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: grey.withOpacity(.4),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          children: [
            Icon(icon,size: 30,color: green,),
            SizedBox(width: 5,),
            Text(mainText,style: TextStyle(fontSize: 18,color: white,),textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }

}