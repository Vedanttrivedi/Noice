import 'package:app/collabSubmit.dart';
import 'package:app/collabclass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Collab extends StatefulWidget {
  final String name;
  Collab({this.name});
  @override
  _CollabState createState() => _CollabState();
}

class _CollabState extends State<Collab> {
  final formkey = GlobalKey<FormState>();
  String question1;
  String choice1;
  String choice2;
  String choice3;
  String question2;
  String choice4;
  String choice5;
  String choice6;
  String senderUid;
  String recieverUid;
  String topic;
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    Stream<QuerySnapshot> snap =
        FirebaseFirestore.instance.collection('user').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final list = snapshot.data.docs;
          for (int i = 0; i < list.length; i++) {
            if (list[i]['name'] == this.widget.name) {
              recieverUid = list[i]['uid'];
              print(recieverUid);
              print("got the collab user");
              break;
            }
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurpleAccent,
              title: Text("Collab",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            body: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(7),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Collab With " + this.widget.name,
                        style:
                            TextStyle(fontSize: 20, color: Colors.deepPurple)),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Text("Questions are radiobased (one choice(mcq))"),
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return "topic is required";
                              }
                              topic = val;
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Caption Of hobby form",
                              prefixIcon: Icon(Icons.closed_caption),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.orange, width: 2.0)),
                            ),
                          ),
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Question 1",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.purple, width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.purple, width: 2.0))),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question is required";
                              }
                              question1 = val;
                              return null;
                            },
                          ),
                          //options for question 1 radio based
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Choice 1 for Question 1",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.deepPurpleAccent,
                                      width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.deepPurpleAccent,
                                      width: 2.0)),
                            ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question is required";
                              }
                              choice1 = val;
                              return null;
                            },
                          ),
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Choice 2 for Question 1",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0))),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question is required";
                              }
                              choice2 = val;
                              return null;
                            },
                          ),
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Choice 3 for Question 1",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0))),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question is required";
                              }
                              choice3 = val;
                              return null;
                            },
                          ),
                          //question 2 checkbox based

                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Question 2",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.purple, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.purple, width: 2.0)),
                            ),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question2 is required";
                              }
                              question2 = val;
                              return null;
                            },
                          ),
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Choice 1 for Question 2",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0))),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question is required";
                              }
                              choice4 = val;
                              return null;
                            },
                          ),
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Choice 2 for Question 2",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0))),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question is required";
                              }
                              choice5 = val;
                              return null;
                            },
                          ),
                          SizedBox(width: 10, height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "Choice 3 for Question 2",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.deepPurpleAccent,
                                        width: 2.0))),
                            validator: (val) {
                              if (val.isEmpty) {
                                return "Question is required";
                              }
                              choice6 = val;
                              return null;
                            },
                          ),
                          //
                          // Text("General textfield question"),
                          SizedBox(height: 10),
                          RaisedButton(
                            child: Text(
                              "Confirm",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            padding: EdgeInsets.all(12),
                            color: Colors.orange,
                            onPressed: () {
                              if (formkey.currentState.validate()) {
                                //print(question1);
                                //print(question2);
                                //print(user.uid);
                                /* CollabClass c1 = CollabClass();
                                c1.setCollab(
                                    question1,
                                    question2,
                                    choice1,
                                    choice2,
                                    choice3,
                                    choice4,
                                    choice5,
                                    choice6,
                                    user.uid,
                                    recieverUid);*/
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CollabSubmit(
                                              question1: question1,
                                              question2: question2,
                                              option1: choice1,
                                              option2: choice2,
                                              option3: choice3,
                                              option4: choice4,
                                              option5: choice5,
                                              option6: choice6,
                                              reciverUid: recieverUid,
                                              topic: this.topic,
                                              collabuser: this.widget.name,
                                            )));
                              }
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
