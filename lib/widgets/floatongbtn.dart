import 'package:care/common/common.dart';
import 'package:care/screens/Floatingbtnscreens/Testimonials.dart';
import 'package:care/screens/Floatingbtnscreens/googlemap.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/screens/Floatingbtnscreens/reach%20us.dart';
import 'package:care/screens/LOGIN/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class floatingBtn extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      backgroundColor: green,
      foregroundColor: darkblue,
      activeBackgroundColor:
      darkblue,
      activeForegroundColor: Colors.white,
      visible: true,
      closeManually: false,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      elevation: 8.0,
      shape: const CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.logout),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          label: 'Logout',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () async {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text('Are you sure you want to logout'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.blue,
                          )),
                      IconButton(
                          onPressed: () {
                            _auth.signOut();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()),
                            );
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.red,
                          )),
                    ],
                  );
                });
          },
        ),
        SpeedDialChild(
          //speed dial child
          child: const Icon(Icons.location_on),
          backgroundColor: Colors.lightBlueAccent,
          foregroundColor: Colors.white,
          label: 'Location',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SimpleMap()),
          ),
        ),
        SpeedDialChild(
          child: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/sensa.jpg',
              )),
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
          label: 'About',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const About()),
          ),
        ),
        SpeedDialChild(
          child: const Icon(Icons.quiz),
          backgroundColor: Colors.purpleAccent,
          foregroundColor: Colors.white,
          label: 'Testimonials',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Testimonials()),
          ),
        ),
        SpeedDialChild(
          child: const Icon(Icons.home),
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          label: 'Home',
          labelStyle: const TextStyle(fontSize: 18.0),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          ),
        ),

        //add more menu item childs here
      ],
    );
  }
}