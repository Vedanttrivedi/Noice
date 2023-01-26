import 'package:app/collab.dart';
import 'package:app/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'collabclass.dart';

class CollabSubmit extends StatefulWidget {
  String collabuser;
  String question1;
  String option1;
  String option2;
  String option3;
  String question2;
  String topic;
  String option4;
  String option5;
  String option6;
  String senderUid = "";
  String reciverUid = "";
  List<String> ansSender = ["Mercedes", "ben10"];
  List<String> ansReciver = [];
  bool senderDone = false;
  bool reciverDone = false;

  CollabSubmit(
      {this.question1,
      this.option1,
      this.option2,
      this.option3,
      this.question2,
      this.option4,
      this.option5,
      this.option6,
      this.reciverUid,
      this.topic,
      this.collabuser});

  @override
  _CollabSubmitState createState() => _CollabSubmitState();
}

class _CollabSubmitState extends State<CollabSubmit> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    String ansQ1 = this.widget.option1;
    String ansQ2 = this.widget.option4;
    List<String> ans = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Last Step To  Submit Collab"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //for question1
              Center(
                child: Text(this.widget.topic,
                    style: TextStyle(fontSize: 30, color: Colors.orange)),
              ),
              Container(
                padding: EdgeInsets.all(7),
                color: Colors.orange,
                child: Column(
                  children: [
                    Text(
                      this.widget.question1,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Column(
                      children: [
                        Text(
                          this.widget.option1,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Radio(
                          value: this.widget.option1,
                          groupValue: ansQ1,
                          onChanged: (val) {
                            setState(() {
                              ansQ1 = val;
                              print("ans = " + ansQ1);
                            });
                          },
                        ),
                        Text(
                          this.widget.option2,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Radio(
                            value: this.widget.option2,
                            groupValue: ansQ1,
                            onChanged: (val) {
                              setState(() {
                                ansQ1 = val;
                              });
                            }),
                        Text(
                          this.widget.option3,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Radio(
                            value: this.widget.option3,
                            groupValue: ansQ1,
                            onChanged: (val) {
                              setState(() {
                                ansQ1 = val;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
              //for question2

              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                color: Colors.deepPurpleAccent,
                child: Column(
                  children: [
                    Text(this.widget.question2,
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                    Column(
                      children: [
                        Text(this.widget.option4,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        Radio(
                            value: this.widget.option4,
                            groupValue: this.widget.option4,
                            onChanged: (val) {
                              setState(() {
                                ansQ2 = val;
                              });
                            }),
                        Text(this.widget.option5,
                            style:
                                TextStyle(color: Colors.black, fontSize: 18)),
                        Radio(
                            value: this.widget.option5,
                            groupValue: this.widget.option4,
                            onChanged: (val) {
                              setState(() {
                                ansQ2 = val;
                              });
                            }),
                        Text(this.widget.option6,
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        Radio(
                            value: this.widget.option6,
                            groupValue: this.widget.option4,
                            onChanged: (val) {
                              setState(() {
                                ansQ2 = val;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
              RaisedButton.icon(
                  onPressed: () {
                    String uniqueid = DateTime.now().toString();
                    CollabClass c1 = CollabClass();
                    c1.setCollab(
                        this.widget.question1,
                        this.widget.question2,
                        this.widget.option1,
                        this.widget.option2,
                        this.widget.option3,
                        this.widget.option4,
                        this.widget.option5,
                        this.widget.option6,
                        user.uid,
                        this.widget.reciverUid,
                        this.widget.topic,
                        [this.widget.option2, this.widget.option6]);
                    print("button pressed");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  padding: EdgeInsets.all(10),
                  color: Colors.purpleAccent,
                  label: Text("Send to " + this.widget.collabuser),
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
