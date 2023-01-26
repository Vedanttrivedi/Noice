import 'package:app/about.dart';
import 'package:app/authmodel.dart';
import 'package:app/forgetpassword.dart';
import 'package:app/signin.dart';
import 'package:flutter/material.dart';
import 'package:app/wrapper.dart';

class SignUp extends StatefulWidget {
  final Function change;
  SignUp({this.change});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget googleLoginButton() {
    return OutlineButton(
        onPressed: () {
          auth.signInWithGoogle();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.grey),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('asset/google_logo.png'), height: 35),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Login with Google',
                        style: TextStyle(color: Colors.black, fontSize: 25)))
              ],
            )));
  }

  final formkey = GlobalKey<FormState>();
  String name = "";
  String gender = "Male";
  String email = "";
  String password = "";
  bool loading = false;
  String unique;
  bool showpass = true;
  String error = "";
  AuthService auth = AuthService();
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
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Column(
            children: [
              Text(
                "SignIn Form",
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
                    SizedBox(height: 20),
                    RaisedButton(
                      child: Text("Signin",
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
                            auth.login(email, password);
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
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                },
                child: Text("AboutUs",
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 25,
                    )),
              ),
              //Image.asset('asset/join2.jpg', width: 300, height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
