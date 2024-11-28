import 'package:flutter/material.dart';

import 'package:todo_app/pages/layers/layer_one.dart';
import 'package:todo_app/pages/layers/layer_sign_in.dart';

import 'package:todo_app/pages/layers/layer_two.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                  'Sign in',
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                )),
            Positioned(top: 290, right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: 318, right: 0, bottom: 28, child: LayerTwo()),
            Positioned(top: 320, right: 0, bottom: 48, child: LayerSignIn()),
          ],
        ),
      ),
    );
  }
}
