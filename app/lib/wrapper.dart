import 'package:app/auth.dart';
import 'package:app/hobby-form.dart';
import 'package:app/home.dart';
import 'package:app/imagepicker.dart';
import 'package:app/newhobby.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/signin.dart';
import 'package:app/signup.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool showSingin = true;
  void toggleView() {
    setState(() {
      showSingin = !showSingin;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    if (user != null) {
      return Home();
    } else {
      return Auth();
    }
  }
}
