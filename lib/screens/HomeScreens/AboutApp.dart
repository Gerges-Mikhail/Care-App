import 'package:care/common/common.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:[
                Color.fromRGBO(14, 135, 162, 1),
                Color.fromRGBO(52, 203, 220, 1),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height / 50,
                ),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(200),
                  color: const Color.fromRGBO(18, 140, 170, 1),
                  child: Container(
                    height: size.height / 2.3,
                    width: size.width / 1.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage('assets/logo.png',),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 15,
                  width: size.width / 1.15,
                  child: const Text(
                    'About Care Application',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: size.height / 4 ,
                  width: size.width / 1.15,
                  child:  Text(
                    'Care app is used by healthcare providers to book appointments and collect patient information. Using Care App — complete with forms for collecting medical history, informed consent, and appointment requests — doctors or nurses can collect and manage patient information and store it securely online. ',
                    style:  TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  width: size.width / 1.15,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded,color: white,size: 35,),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
