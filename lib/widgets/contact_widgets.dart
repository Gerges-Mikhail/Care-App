import 'package:care/widgets/media.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidgets extends StatelessWidget {
  const ContactWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const SizedBox(
          width: 5,
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
                throw "Error occured sending an email";
              }
            },
            child: const MediaContainer(
              icon: 'assets/google.ico',
            )),
        const SizedBox(
          width: 5,
        ),
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
            child: const MediaContainer(
              icon: 'assets/phone.png',
            )),
      ],
    );
  }
}
