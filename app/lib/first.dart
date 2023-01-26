import 'package:app/signin.dart';
import 'package:app/signup.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  final Function change;
  First({this.change});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 55, horizontal: 88),
            child: Column(
              children: [
                Image.asset(
                  'asset/logo.png',
                  width: 200,
                ),
                Text(
                  "Noice",
                  style: TextStyle(fontSize: 30, color: Colors.yellow),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
            child: Text(
              "Want To Connect Your Self With  Family and Friends via Hobbies??",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.black, Colors.grey])),
                child: GestureDetector(
                  onTap: () {
                    this.change(2);
                  },
                  child: Text("Create Account",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.black, Colors.grey])),
                child: GestureDetector(
                  onTap: () {
                    this.change(3);
                  },
                  child: Text("Login",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
