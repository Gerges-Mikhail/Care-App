import 'package:care/common/common.dart';
import 'package:care/screens/FORMS/form1_medical_consent.dart';
import 'package:care/screens/FORMS/form2-personal_info.dart';
import 'package:care/screens/HomeScreens/AboutApp.dart';
import 'package:care/screens/HomeScreens/Appointments%20Lists.dart';
import 'package:care/screens/forms/form3_Request_an_appointment.dart';
import 'package:care/widgets/ButtonHome.dart';
import 'package:care/widgets/contact_widgets.dart';
import 'package:care/widgets/floatongbtn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser;
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkblue,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: size.height / 10,
                          ),
                           SizedBox(
                            height: size.height / 25,
                             child: Text(
                               'Dr.Sensa',
                               style: TextStyle(
                                   color: green,
                                   fontSize: 21,
                                   fontWeight: FontWeight.bold),
                             ) ,
                          ),
                          SizedBox(
                            height: size.height/25,
                            child: Text(
                              'Physiotherapy',
                              style: TextStyle(
                                color: darkgreen,
                                fontSize: 18,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: size.height / 50,//400
                     width: size.width / 1.03,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height / 80,
                            ),
                            Text(
                              'Welcome ${user!.email!.substring(0, 6)}',
                              style: TextStyle(
                                color: darkblue,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            Container(
                              width: size.width / .2,
                              height: size.height / 5,
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius: const BorderRadius.all(
                                     Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset('assets/care.jpg',width: size.width,),
                              ),
                            ),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                ButtonHome(
                                  icon: Icons.edit,
                                  mainText: 'Medical Consent Form',
                                  hintText: 'please,fill out this form',
                                  height: size.height / 5,//165
                                  width: size.width / 2.4,//155
                                  pagename: const MedicalForm(),
                                ),
                                ButtonHome(
                                  icon: Icons.medical_information,
                                  mainText: 'Your Medical History',
                                  hintText: 'we value your privacy',
                                  height: size.height / 5,//165
                                  width: size.width / 2.4,//155
                                  pagename: const FormMedicalHistory(),
                                ),
                              ],
                            ),
                             SizedBox(
                              height: size.height / 80,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                ButtonHome(
                                  icon: Icons.person,
                                  mainText: 'Patient reservations',
                                  hintText: 'Appointments',
                                  height: size.height / 5,//165
                                  width: size.width / 2.4,//155
                                  pagename: const Appointments(),
                                ),
                                ButtonHome(
                                  icon: Icons.info_outline,
                                  mainText: 'About application',
                                  hintText: 'The services at the application',
                                  height: size.height / 5,//165
                                  width: size.width / 2.4,//155
                                  pagename: const AboutApp(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height / 80,
                            ),
                             ButtonHome(
                              icon: Icons.calendar_month,
                              mainText: 'Request an appointment',
                              hintText:
                                  'Please schedule appointment 1 day in advance',
                              height: size.height / 5,//165
                              width: size.width,//155
                              pagename: const FormRequest(),
                            ),
                            SizedBox(
                              height: size.height / 85 ,
                            ),
                            Divider(
                              thickness: 2,
                              color: darkblue,
                              height: size.height / 30,
                            ),
                            const ContactWidgets(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: floatingBtn(),
    );
  }
}
