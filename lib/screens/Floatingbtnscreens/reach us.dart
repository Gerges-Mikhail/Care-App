import 'package:care/common/common.dart';
import 'package:care/widgets/Contact.dart';
import 'package:care/widgets/floatongbtn.dart';
import 'package:care/widgets/media.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: 0, top: 47, left: 2, right: 2),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'C A R E',
                        style: TextStyle(
                          color: green,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 700,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: const Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                    color: darkblue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: darkblue,
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                child: CircleAvatar(
                                  backgroundImage: const AssetImage('assets/sensa.jpg'),
                                  radius: 100,
                                  backgroundColor: white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: green,
                                  ),

                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Dr.Sensa',
                                style: TextStyle(
                                    color: darkblue,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Physiotherapy ',
                                style: TextStyle(
                                  color: darkgreen,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Dr Sensa works with patients to develop customized programs designed to restore as much as possible their functional ability and movement. she helps patients at all stages of life — from infant to old age.',
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    const phone = '01111618689';
                                    const url = 'tel:$phone';
                                    if (await canLaunch(url)) {
                                      await launch(
                                          url); //forceWebView is true now
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: const Contact(name: 'Call Us')),
                              const SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                  onTap: () async {
                                    String email =
                                        'gergesmikhail9999@gmail.com';
                                    String subject = 'This is a test email';
                                    String body = 'This is a test email body';

                                    String emailUrl =
                                        "mailto:$email?subject=$subject&body=$body";

                                    if (await canLaunch(emailUrl)) {
                                      await launch(emailUrl);
                                    } else {
                                      throw "Error occurred sending an email";
                                    }
                                  },
                                  child: const Contact(name: 'Email Us')),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    const url =
                                        'https://www.facebook.com/gergeslamp';
                                    if (await canLaunch(url)) {
                                      await launch(
                                          url); //forceWebView is true now
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: const MediaContainer(
                                    icon: 'assets/facebook.ico',
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () async {
                                    const url =
                                        'https://www.linkedin.com/in/gerges-mikhail-8578661ba/';
                                    if (await canLaunch(url)) {
                                      await launch(
                                          url); //forceWebView is true now
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: const MediaContainer(
                                    icon: 'assets/in.ico',
                                  )),
                            ],
                          ),
                        ],
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
