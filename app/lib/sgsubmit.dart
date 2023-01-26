import 'package:flutter/material.dart';
import 'profile.dart';

class SgSubmit extends StatefulWidget {
  String title;
  String collabuser;

  String question1;
  String option1;
  String option2;
  String option3;

  String question2;
  String option4;
  String option5;
  String option6;
  String option7 = "cool";
  String question3;
  String senderUid = "";
  String reciverUid = "";
  List<String> ansSender = [];
  List<String> ansReciver = [];
  bool senderDone = false;
  bool reciverDone = false;
  SgSubmit({
    this.title,
    this.question3,
    this.collabuser,
    this.question1,
    this.option1,
    this.option2,
    this.option3,
    this.question2,
    this.option4,
    this.option5,
    this.option6,
    this.reciverUid,
  });

  @override
  _SgSubmitState createState() => _SgSubmitState();
}

class _SgSubmitState extends State<SgSubmit> {
  bool opt1 = false;
  bool opt2 = false;
  bool opt3 = false;
  bool opt4 = false;
  bool opt5 = false;
  bool opt6 = false;
  bool opt7 = false;

  //String q1 = this.widget.option1;
  @override
  Widget build(BuildContext context) {
    String q1 = this.widget.option1;
    String q2 = this.widget.option4;
    List<String> ans = [];
    return Scaffold(
      appBar: AppBar(
        title: Text("Collab Submission"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: [
                Center(
                  child: Text(this.widget.title,
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
                          Checkbox(
                            activeColor: Colors.red,
                            hoverColor: Colors.orange,
                            value: this.opt1,
                            onChanged: (val) {
                              setState(() {
                                this.opt1 = true;
                                this.opt2 = false;
                                this.opt3 = false;
                              });
                            },
                          ),
                          Text(
                            this.widget.option2,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Checkbox(
                            activeColor: Colors.red,
                            hoverColor: Colors.orange,
                            value: this.opt2,
                            onChanged: (val) {
                              setState(() {
                                this.opt2 = true;
                                this.opt1 = false;
                                this.opt3 = false;
                              });
                            },
                          ),
                          Text(
                            this.widget.option3,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Checkbox(
                            activeColor: Colors.red,
                            hoverColor: Colors.orange,
                            value: opt3,
                            onChanged: (val) {
                              setState(() {
                                this.opt1 = false;
                                this.opt2 = false;
                                this.opt3 = true;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7),
                  color: Colors.deepPurpleAccent,
                  child: Column(
                    children: [
                      Text(
                        this.widget.question2,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Column(
                        children: [
                          Text(
                            this.widget.option4,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Checkbox(
                            activeColor: Colors.red,
                            hoverColor: Colors.orange,
                            value: opt4,
                            onChanged: (val) {
                              setState(() {
                                this.opt4 = !this.opt4;
                              });
                            },
                          ),
                          Text(
                            this.widget.option5,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          Checkbox(
                            activeColor: Colors.red,
                            hoverColor: Colors.orange,
                            value: opt5,
                            onChanged: (val) {
                              setState(() {
                                this.opt5 = !this.opt5;
                              });
                            },
                          ),
                          Text(
                            this.widget.option6,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Checkbox(
                            activeColor: Colors.red,
                            hoverColor: Colors.orange,
                            value: this.opt6,
                            onChanged: (val) {
                              this.setState(() {
                                this.opt6 = !this.opt6;
                              });
                              print("chekded" + opt6.toString());
                            },
                          ),
                          Text(
                            this.widget.option7,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Checkbox(
                            activeColor: Colors.red,
                            hoverColor: Colors.orange,
                            value: opt7,
                            onChanged: (val) {
                              setState(() {
                                this.opt7 = !this.opt7;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text(this.widget.question3),
                      TextFormField(
                        decoration: InputDecoration(labelText: "Your Reply"),
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  padding: EdgeInsets.all(20),
                  color:
                      Color.alphaBlend(Colors.deepPurpleAccent, Colors.black),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Text("Send To " + this.widget.collabuser),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
