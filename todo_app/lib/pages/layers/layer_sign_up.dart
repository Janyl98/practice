import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/constants/config.dart';

import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/signin.dart';

class LayerSignUp extends StatefulWidget {
  const LayerSignUp({super.key});

  @override
  State<LayerSignUp> createState() => _LayerSignUpState();
}

class _LayerSignUpState extends State<LayerSignUp> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  registration() async {
    if (password != "" && email != "" && password != "") {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            )));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too weak",
                style: TextStyle(fontSize: 20.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 20.0),
              )));
        }
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
            top: 59,
            child: Text(
              'Username',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 89,
              child: SizedBox(
                width: 310,
                child: TextField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: hintText),
                  ),
                ),
              )),
          const Positioned(
            left: 59,
            top: 139,
            child: Text(
              'Email',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 169,
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
            top: 219,
            child: Text(
              'Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
              left: 59,
              top: 249,
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
                      if (namecontroller.text != "" &&
                          mailcontroller.text != "" &&
                          passwordcontroller.text != "") {
                        setState(() {
                          email = mailcontroller.text;
                          name = namecontroller.text;
                          password = passwordcontroller.text;
                        });
                      }
                      registration();
                    },
                    child: const Text(
                      'Sign up',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 13, color: hintText),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: checkbox,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
