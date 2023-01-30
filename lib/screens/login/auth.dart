import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/screens/LOGIN/login.dart';
import 'package:care/screens/login/splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot){
          if(snapshot.hasData){
            return SplashScreen();
          }else{
            return Login();
          }
        }),
      ),
    );
  }
}
