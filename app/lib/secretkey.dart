import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authmodel.dart';

class SecretKey extends StatefulWidget {
  @override
  _SecretKeyState createState() => _SecretKeyState();
}

class _SecretKeyState extends State<SecretKey> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    AuthService auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        title: Text("secret key"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text("Please Please Please Copy the Secret Key"),
            SizedBox(height: 20),
            SelectableText(user.uid,
                style: TextStyle(fontSize: 18, color: Colors.blue)),
            SizedBox(height: 20),
            Text("If You forget your login details"),
            Text("Secret Key is the Only way "),
            Text("to get your account back"),
            Text("or to login back"),
            Text("Please Save it somewhere in "),
            Text("you can save it in doc,text file",
                style: TextStyle(color: Colors.deepOrangeAccent)),
            Text("the reaseon for this is"),
            Text("  we dont ask for email for using Noice"),
            Text("So you cannot reset via email")
          ],
        ),
      ),
    );
  }
}
