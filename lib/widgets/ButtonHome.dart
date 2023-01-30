import 'package:care/common/common.dart';
import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
  final IconData icon;
  final String mainText;
  final String hintText;
  final double width;
  final double height;
  final Widget pagename;

  const ButtonHome(
      {super.key,
      required this.icon,
      required this.mainText,
      required this.hintText,
      required this.width,
      required this.height, required this.pagename});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pagename),
          );
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: green)
                )
            ),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                {
                  return Colors.red.shade200;
                }
              else{
                return Colors.greenAccent.shade100;
              }
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Icon(
                icon,
                size: size.height / 20,
                color: green,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                mainText,
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height / 85,
              ),
              Text(hintText,
                  style: TextStyle(fontSize: 13, color: grey),
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
