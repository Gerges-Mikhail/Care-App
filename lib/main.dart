import 'package:care/provider/provider.dart';
import 'package:care/screens/LOGIN/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelHud>(
      create: (context) => ModelHud(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xff055b95),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Auth(),
      ),
    );
  }
}
