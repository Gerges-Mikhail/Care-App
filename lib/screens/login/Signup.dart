import 'package:care/common/common.dart';
import 'package:care/firebase/auth.dart';
import 'package:care/provider/provider.dart';
import 'package:care/screens/Floatingbtnscreens/home.dart';
import 'package:care/screens/LOGIN/login.dart';
import 'package:care/widgets/contact_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _auth = FirebaseAuth.instance;
  TextEditingController namelController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = "";
  String password = "";
  String fullname = "";
  bool showSpinner = false;
  //FirebaseAuth auth = FirebaseAuth.instance;
  bool _isVisibilty = true;
  final formKey = GlobalKey<FormState>();
  final auth = Auth();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModelHud>(context).isLoading,
          child: Form(
            key: formKey,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.topCenter, colors: [
                Color(0xff055b95),
                Color(0xff0567a8),
                Color(0xff077dcd),
              ])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Sign Up",
                          style:
                              TextStyle(color: Colors.white, fontSize: 40),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Welcome",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          const BoxShadow(
                                              color: Color.fromRGBO(12, 21, 231,
                                                  0.30196078431372547),
                                              blurRadius: 20,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey))),
                                          child: TextFormField(
                                            onSaved: (val){
                                              email = val!;

                                            },
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
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.alternate_email,
                                                color: darkblue,
                                              ),
                                              hintText: "Email",
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                            ),
                                            // controller: _controller,
                                          ),
                                        ),

                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey))),
                                          child: TextFormField(
                                            onSaved: (val){
                                              password = val!;
                                            },
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
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              border: InputBorder.none,
                                              prefixIcon: Icon(
                                                Icons.password,
                                                color: darkblue,
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _isVisibilty = !_isVisibilty;
                                                  });
                                                },
                                                icon: _isVisibilty
                                                    ? const Icon(Icons.visibility_off)
                                                    : Icon(
                                                        Icons.visibility,
                                                        color: darkblue,
                                                      ),
                                              ),
                                            ),
                                            obscureText: _isVisibilty,
                                          ),
                                        ),
                                        // Container(
                                        //   padding: const EdgeInsets.all(10),
                                        //   decoration: const BoxDecoration(
                                        //       border: const Border(bottom: BorderSide(color: Colors.grey))
                                        //   ),
                                        //   child: TextField(
                                        //     decoration: InputDecoration(
                                        //       hintText: "Confirm password",
                                        //       hintStyle: const TextStyle(color: Colors.grey),
                                        //       border: InputBorder.none,
                                        //       prefixIcon: Icon(Icons.password,color: darkblue,),
                                        //       suffixIcon: IconButton(
                                        //         onPressed: () {
                                        //           setState(
                                        //                   () {
                                        //                 _isVisibilty = !_isVisibilty;
                                        //               }
                                        //           );
                                        //         },
                                        //         icon: _isVisibilty
                                        //             ? Icon(Icons.visibility_off)
                                        //             : Icon(Icons.visibility,color: darkblue,),
                                        //       ),
                                        //     ),
                                        //     obscureText: _isVisibilty,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Builder(
                                  builder: (context) {
                                    return InkWell(
                                      onTap: () async {
                                        final modelHud = Provider.of<ModelHud>(context,listen: false);
                                        modelHud.changeIsLoading(true);
                                        if(formKey.currentState!.validate()){
                                          formKey.currentState!.save();
                                          try{
                                            print(email);
                                            print(password);
                                            final authResult = await auth.signup(email, password);
                                            if(User != null)
                                              {
                                                modelHud.changeIsLoading(false);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => const HomePage()),
                                                );
                                              }
                                          }on PlatformException catch(e){
                                            modelHud.changeIsLoading(false);                                              Scaffold.of(context).showSnackBar(SnackBar(
                                                content: Text( e.message!,
                                                ),
                                            ),
                                            );
                                          }
                                        }
                                        modelHud.changeIsLoading(false);
                                      },
                                      child: Container(
                                        height: 50,
                                        margin: const EdgeInsets.symmetric(horizontal: 50),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: darkblue,
                                        ),
                                        child: const Center(
                                          child: const Text(
                                            "SignUp",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Text.rich(
                                  TextSpan(
                                      text: "Already have an account?",
                                      style: TextStyle(
                                          color: Colors.grey[700], fontSize: 15),
                                      children: [
                                        TextSpan(
                                          text: "Login",
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              nextScreen(context, const Login());
                                            },
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                const Text(
                                  "Reach Us",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                               const ContactWidgets(),
                              ],
                            ),
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
