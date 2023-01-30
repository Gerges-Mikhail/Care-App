import 'package:care/common/common.dart';
import 'package:care/firebase/auth.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/screens/login/splashscreen.dart';
import 'package:care/widgets/contact_widgets.dart';
import 'package:flutter/services.dart';
import 'package:care/screens/LOGIN/Signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> _userLoginFormKey = GlobalKey();
  bool isSignIn =false;
  bool google =false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool _isVisibilty = true;
  bool showSpinner = false;
  final _textcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final auth = Auth();

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textcontroller.dispose();
    _passwordcontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Form(
          key: _userLoginFormKey,
              child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Color(0xff055b95),
                      Color(0xff0567a8),
                      Color(0xff077dcd),
                    ]
                )
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 10,),
                      Text("Welcome back", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 60,),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [BoxShadow(
                                      color: Color.fromRGBO(
                                          18, 46, 243, 0.30196078431372547),
                                      blurRadius: 20,
                                      offset: Offset(0, 10)
                                  )]
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey))
                                    ),
                                    child: TextFormField(
                                      onSaved: (val){email = val!;},
                                      controller: _textcontroller,
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                          print(email);
                                        });
                                      },
                                      validator: (val) {
                                        return RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(val!)
                                            ? null
                                            : "Please enter a valid email";
                                      },
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: const TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        prefixIcon: Icon(Icons.alternate_email,color: darkblue,),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey))
                                    ),
                                    child: TextFormField(
                                      onSaved: (val){password = val!;},
                                      controller: _passwordcontroller,
                                      onChanged: (val) {
                                        setState(() {
                                          password = val;
                                          print(password);
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.length < 6) {
                                          return "Short password";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle: const TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        prefixIcon: Icon(Icons.password,color: darkblue,),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(
                                                    () {
                                                  _isVisibilty = !_isVisibilty;
                                                }
                                            );
                                          },
                                          icon: _isVisibilty
                                              ? const Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility,color: darkblue,),
                                        ),
                                      ),
                                      obscureText: _isVisibilty,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                           //  const SizedBox(height: 20,),
                           // const Text("Forgot Password?", style: const TextStyle(color: Colors.grey),),
                            const SizedBox(height: 20,),
                          Builder(
                            builder: (context) {
                              return InkWell(
                                onTap: ()async{
                                  if(_userLoginFormKey.currentState!.validate())
                                    {
                                      _userLoginFormKey.currentState!.save();
                                      try{
                                        print(email);
                                        print(password);
                                        final authResult = await auth.signin(email, password);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const SplashScreen()),
                                        );
                                      }on PlatformException catch(e){
                                        print(e.toString());
                                        Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text( e.message!,
                                          ),
                                        ),
                                        );
                                      }
                                    }
                                },
                                child: Container(
                                    height: 50,
                                    margin: const EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: darkblue,
                                    ),
                                    child: const Center(
                                      child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                              );
                            }
                          ),
                            const SizedBox(height: 40,),
                            Text.rich(
                              TextSpan(
                                  text: "Don't have an account?",
                                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                                  children: [
                                    TextSpan(
                                      text: "  Sign Up",
                                      style: const TextStyle(
                                          color: Colors.blue, fontWeight: FontWeight.bold),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          nextScreen(context, const SignIn());
                                        },
                                    ),
                                  ]),
                            ),
                            const SizedBox(height: 20,),
                            const Text("Reach Us", style: TextStyle(color: Colors.grey),),
                            const SizedBox(height: 30,),
                            const ContactWidgets(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
          ),
        ),
            ),
      ),
    );
  }
}
