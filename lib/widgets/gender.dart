import 'package:care/common/common.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget{
  final String name;
  final IconData icon;
  final bool isSelected;

  const Gender({super.key, required this.name, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected? green :darkblue,
        ),
        color:isSelected? darkblue : Colors.grey.shade200,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,color: isSelected? green : darkblue),
          SizedBox(height: 5,),
          Text(name,style: TextStyle(fontSize: 18,color: isSelected? green : darkblue ),)
        ],
      ),
    );
  }

}