import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/home.dart';
import 'package:todo_app/pages/layers/layer_one.dart';
import 'package:todo_app/pages/layers/layer_sign_up.dart';
import 'package:todo_app/pages/layers/layer_two.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/primaryBg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Stack(
          children: <Widget>[
            Positioned(
                top: 200,
                left: 59,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            Positioned(top: 290, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 318, right: 0, bottom: 28, child: LayerTwo()),
            Positioned(top: 320, right: 0, bottom: 48, child: LayerSignUp()),
          ],
        ),
      ),
    );
  }
}
