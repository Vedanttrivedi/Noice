import 'package:app/userclass.dart';
import 'package:flutter/material.dart';
import 'hobbybase.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HobbyForm extends StatefulWidget {
  @override
  _HobbyFormState createState() => _HobbyFormState();
}

class _HobbyFormState extends State<HobbyForm> {
  final formkey = GlobalKey<FormState>();
  String first_choice = "Reading";
  String second_choice = "Beach";
  List<String> hob3 = [];
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    var color = Colors.white;
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Text("Let's Go",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.deepOrangeAccent,
                  fontFamily: "sans-serif")),
          Form(
            key: formkey,
            child: Column(
              children: [
                Text("What Do You Like Most <3",
                    style: TextStyle(fontSize: 21, color: Colors.blue)),
                Row(
                  children: [
                    Text("Reading",
                        style: TextStyle(
                            fontSize: 20, color: Colors.purpleAccent)),
                    Radio(
                        value: "Reading",
                        onChanged: (val) {
                          setState(() {
                            first_choice = val;
                          });
                        },
                        groupValue: first_choice),
                    Text("Eating",
                        style: TextStyle(
                            fontSize: 20, color: Colors.purpleAccent)),
                    Radio(
                        value: "Eating",
                        onChanged: (val) {
                          setState(() {
                            first_choice = val;
                          });
                        },
                        groupValue: first_choice),
                    Text("Watching",
                        style: TextStyle(
                            fontSize: 20, color: Colors.purpleAccent)),
                    Radio(
                        value: "Watching",
                        onChanged: (val) {
                          setState(() {
                            first_choice = val;
                          });
                        },
                        groupValue: first_choice),
                  ],
                ),
                SizedBox(width: 10),
                Text("What kind of place you like???",
                    style: TextStyle(fontSize: 21, color: Colors.blue)),
                Row(
                  children: [
                    Text("Beach",
                        style: TextStyle(
                            fontSize: 20, color: Colors.purpleAccent)),
                    Radio(
                        value: "Beach",
                        onChanged: (val) {
                          setState(() {
                            second_choice = val;
                          });
                        },
                        groupValue: second_choice),
                    Text("Mountain",
                        style: TextStyle(
                            fontSize: 20, color: Colors.purpleAccent)),
                    Radio(
                        value: "Mountain",
                        onChanged: (val) {
                          setState(() {
                            second_choice = val;
                          });
                        },
                        groupValue: second_choice),
                    Text("Desert",
                        style: TextStyle(
                            fontSize: 20, color: Colors.purpleAccent)),
                    Radio(
                        value: "Desert",
                        onChanged: (val) {
                          setState(() {
                            second_choice = val;
                          });
                        },
                        groupValue: second_choice),
                  ],
                ),
                /*
                Text("Check Mark",
                    style: TextStyle(fontSize: 20, color: Colors.blue)),
                Row(
                  children: [
                    Text("Cricket"),
                    Checkbox(
                        onChanged: (val) {
                          setState(() {
                            val = !val;
                          });
                        },
                        value: true),
                  ],
                ),*/
                SizedBox(width: 10),
                RaisedButton(
                  child: Text("Done"),
                  padding: EdgeInsets.all(15),
                  color: Colors.blue,
                  onPressed: () {
                    HobbyDatabase h1 = HobbyDatabase(uid: user.uid);
                    h1.setHobby(first_choice, second_choice);
                    dynamic res = h1.firestore(user.uid);
                    UserBase customuser = UserBase();

                    print("done");
                    print(res);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
