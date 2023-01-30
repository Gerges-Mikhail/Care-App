import 'package:flutter/material.dart';

class DoctorsCV extends StatelessWidget{
  final String image;
  final String name;
  final String cv;

  const DoctorsCV({super.key, required this.image, required this.name, required this.cv});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(height: 10,),
          Text(name,style: TextStyle(fontSize: 20,color: Colors.black),textAlign: TextAlign.center,),
          SizedBox(height: 5,),
          Text(cv,style: TextStyle(fontSize: 18,color: Colors.grey),textAlign: TextAlign.center),
        ],
      ),
    );
  }

}