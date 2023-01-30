import 'dart:async';

import 'package:care/firebase/auth.dart';
import 'package:care/main.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/screens/LOGIN/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  HomePage()));
    });
  }
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
          child: Column(
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
                  'Welcome',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: size.height / 15,
                width: size.width / 1.15,
                child: const Text(
                  'we are glad to see you',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 10,
              ),
              Container(
                height: size.height / 20,
                width: size.width / 18,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              Container(
                  height: size.height / 15,
                  width: size.width,
                  alignment: Alignment.center,
                  child: const Text('Please wait...',style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w500),)
              )

            ],
          ),
        ),
      ),
    );
  }
}
