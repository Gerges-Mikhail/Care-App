import 'package:care/common/common.dart';
import 'package:flutter/material.dart';

Widget ListTiLeAppointment( id , name , phonenumber , date)=>ListTile(
  leading: CircleAvatar(
    backgroundColor: white,
    child: IconButton(
      icon: Icon(Icons.check_circle_outline),
      onPressed: (){
        },
    ),
  ),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(
            'Name : ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('$name'),
        ],
      ),
      Row(
        children: [
          Text(
            'Code : ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('$id'),
        ],
      ),
    ],
  ),
  subtitle: Column(
    children: [
      Row(
        children: [
          Text(
            'Date : ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('$date'),
        ],
      ),
      Row(
        children: [
          Text(
            'Phone : ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('$phonenumber'),
        ],
      ),
      Divider(color: darkblue,),
    ],
  ),

);