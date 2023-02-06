import 'package:app/first.dart';
import 'package:app/whyaccount.dart';
import 'package:flutter/material.dart';
import 'package:app/signin.dart';
import 'package:app/signup.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  int showFirst = 1;
  void change(int f) {
    setState(() {
      showFirst = f;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showFirst == 1) {
      return First(change: this.change);
    } else if (showFirst == 2) {
      return SignIn(change: this.change);
    } else if (showFirst == 3) {
      return SignUp(change: this.change);
    } else if (showFirst == 4) {
      return WhyAccount(change: this.change);
    }
    return null;
  }
}
