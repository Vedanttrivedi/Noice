import 'dart:ffi';

import 'package:app/about.dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';
import 'package:app/authmodel.dart';
import 'package:app/loading.dart';
import 'package:app/usermodel.dart';
import 'package:app/wrapper.dart';

class SignIn extends StatefulWidget {
  final Function change;
  SignIn({this.change});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  String name = "";
  String gender = "Male";
  String email = "";
  String password = "";
  bool loading = false;
  String unique;
  bool showpass = true;
  String error = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title:
            Text("Noice", style: TextStyle(color: Colors.yellow, fontSize: 20)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Text(
                "Signup Form",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Username",
                          prefixIcon: Icon(Icons.event_available_sharp,
                              color: Colors.yellow)),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "this field is required";
                        }
                        name = val;
                        email = name + "@mail.com";
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: showpass,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.yellow,
                            ),
                            onPressed: () {
                              setState(() {
                                showpass = !showpass;
                              });
                            },
                          ),
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.yellow,
                          )),
                      validator: (val) {
                        if (val.isEmpty || val.length <= 6) {
                          return "password should be atleast 6 characters long";
                        }
                        password = val;
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("Signup",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                color: Colors.yellow,
                onPressed: () {
                  //this.widget.showSignin();
                  // Navigator.pop(context);
                  if (formkey.currentState.validate()) {
                    setState(() {
                      loading = true;
                      unique = DateTime.now().toString() + name;
                    });
                    AuthService auth = AuthService();

                    void check() async {
                      final result =
                          auth.registerEmail(name, gender, email, password);
                      print(result);
                      if (result == null) {
                        setState(() {
                          print("helow");
                          this.error = "Username is already registerd";
                        });
                      } else {
                        this.error = "";
                      }
                    }

                    check();
                  } else {
                    setState(() {
                      loading = false;
                    });
                    print("form is not valid");
                  }
                },
              ),
              Row(
                children: [
                  Text(
                    "Already have Account",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  FlatButton(
                    child: Text("signin",
                        style: TextStyle(color: Colors.blue, fontSize: 18)),
                    padding: EdgeInsets.all(2),
                    onPressed: () {
                      this.widget.change(3);
                    },
                  )
                ],
              ),
              RaisedButton(
                onPressed: () {
                  this.widget.change(4);
                },
                child: Text(
                  "Why Create Account",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(error, style: TextStyle(color: Colors.red)),
              Text(
                "as we dont ask for email to reset password we are requesting please please please do not forget your username and password other wise you won't be able  to recover your account!",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  "please please do not forget!you can save this details somewhere like doc file,text file",
                  style: TextStyle(fontSize: 20, color: Colors.redAccent))
              /*FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Text("AboutUs",
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 25,
                    )),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
