import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/constants/config.dart';

import 'package:todo_app/pages/home.dart';

import 'package:todo_app/services/auth.dart';

class LayerSignIn extends StatefulWidget {
  const LayerSignIn({super.key});

  @override
  State<LayerSignIn> createState() => _LayerSignInState();
}

class _LayerSignInState extends State<LayerSignIn> {
  String email = "", password = "";

  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  userlogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 20.0),
            )));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong password Provided by User",
              style: TextStyle(fontSize: 20.0),
            )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return SizedBox(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          const Positioned(
            left: 59,
            top: 99,
            child: Text(
              'Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 129,
              child: SizedBox(
                width: 310,
                child: TextField(
                  controller: mailcontroller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          const Positioned(
            left: 59,
            top: 199,
            child: Text(
              'Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 229,
              child: SizedBox(
                width: 310,
                child: TextField(
                  controller: passwordcontroller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          const Positioned(
              right: 60,
              top: 296,
              child: Text(
                'Forgot Password',
                style: TextStyle(
                    color: forgotPasswordText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
          Positioned(
              left: 46,
              top: 361,
              child: Checkbox(
                checkColor: Colors.black,
                activeColor: checkbox,
                value: isChecked,
                onChanged: (bool? value) {
                  isChecked = value!;
                },
              )),
          const Positioned(
              left: 87,
              top: 375,
              child: Text(
                'Remember Me',
                style: TextStyle(
                    color: forgotPasswordText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 365,
              right: 60,
              child: Container(
                width: 99,
                height: 35,
                decoration: const BoxDecoration(
                  color: signInButton,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: GestureDetector(
                    onTap: () {
                      if (mailcontroller.text != "" &&
                          passwordcontroller.text != "") {
                        setState(() {
                          email = mailcontroller.text;
                          password = passwordcontroller.text;
                        });
                      }
                      userlogin();
                    },
                    child: const Text(
                      'Sign in',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 432,
              left: 59,
              child: Container(
                height: 0.5,
                width: 310,
                color: inputBorder,
              )),
          Positioned(
              top: 482,
              left: 120,
              right: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      AuthMethods().signInWithGoogle(context);
                    },
                    child: Container(
                      width: 59,
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: signInBox),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Image.asset(
                        'assets/images/icon_google.png',
                        width: 20,
                        height: 21,
                      ),
                    ),
                  ),
                  const Text(
                    'or',
                    style: TextStyle(fontSize: 18, color: hintText),
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthMethods().signInWithApple();
                    },
                    child: Container(
                      width: 59,
                      height: 48,
                      decoration: BoxDecoration(
                          border: Border.all(color: signInBox),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Image.asset(
                        'assets/images/icon_apple.png',
                        width: 20,
                        height: 21,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
