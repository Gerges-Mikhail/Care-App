import 'package:flutter/material.dart';

class custom_text extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  custom_text({
    required this.text,
    required this.size,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,fontWeight: fontWeight,color: color),);
  }
}

Color white = Colors.white;
Color grey = Colors.grey;
Color darkblue = Color(0xff055b95);
Color green = Color(0xff23ff0b);
Color darkgreen = Color(0xff22c20f);

void nextScreen(context ,page){
  Navigator.push(context, MaterialPageRoute(builder: (context ) => page));
}
void nextScreenReplace(context ,page){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context ) => page));
}

void nextScreenof(context ,page){
  Navigator.of(context).push(MaterialPageRoute(builder: (context ) => page));
}

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message,style: const TextStyle(fontSize: 15),),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
    action: SnackBarAction(label: 'successfully', onPressed: (){},textColor: Colors.white,),
  ));
}