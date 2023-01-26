import 'package:flutter/material.dart';

class SgDone extends StatefulWidget {
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
  String option7;
  String question3;
  String senderUid = "";
  String reciverUid = "";
  List<String> ansSender = [];
  List<String> ansReciver = [];
  bool senderDone = false;
  bool reciverDone = false;
  SgDone({
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
  _SgDoneState createState() => _SgDoneState();
}

class _SgDoneState extends State<SgDone> {
  @override
  Widget build(BuildContext context) {
    String choice1 = "";
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(this.widget.question1),
            Column(
              children: [
                Text(this.widget.option1),
                Radio(
                  hoverColor: Colors.orange,
                  value: this.widget.option1,
                  groupValue: choice1,
                  onChanged: (val) {
                    setState(() {
                      choice1 = val;
                      print(choice1);
                    });
                  },
                ),
                Text("2"),
                Radio(
                  value: "BIKE",
                  groupValue: choice1,
                  onChanged: (val) {
                    setState(() {
                      choice1 = val;
                      print(choice1);
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
