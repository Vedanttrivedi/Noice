import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowMatch extends StatefulWidget {
  final String collaid;
  ShowMatch({this.collaid});
  @override
  _ShowMatchState createState() => _ShowMatchState();
}

class _ShowMatchState extends State<ShowMatch> {
  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> snap = FirebaseFirestore.instance
        .collection('collab')
        .doc(this.widget.collaid)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          String currenuserq1 = snapshot.data['ansSender'][0];
          bool currenuserq2;
          bool q1 = false;
          bool q2 = false;
          int matchScore = 0;
          if (snapshot.data['ansSender'][0] ==
              snapshot.data['ansReciever'][0]) {
            matchScore += 1;
            q1 = true;
          }
          if (snapshot.data['ansSender'][1] ==
              snapshot.data['ansReciever'][1]) {
            matchScore += 1;
            q2 = true;
          }

          //orange for logged in user
          //purple for not logged in user
          return Scaffold(
              appBar: AppBar(),
              body: Column(
                children: [
                  Text("Your Color is black"),
                  Text("your friend 's Color is white"),
                  Text("if both 's matched than color is white"),
                  Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.all(7),
                    color: Colors.orange,
                    child: Column(
                      children: [
                        Text(
                          snapshot.data['question1'],
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.purpleAccent,
                            fontFamily: "ariel",
                          ),
                        ),
                        SizedBox(width: 10),
                        FlatButton(
                          onPressed: () {},
                          child: Text("+1"),
                          color: Colors.white,
                          padding: EdgeInsets.all(7),
                        ),
                        Row(
                          children: [
                            q1
                                ? Text(
                                    snapshot.data['ansSender'][0],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: "ariel",
                                    ),
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        snapshot.data['ansSender'][0],
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: "ariel",
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(snapshot.data['ansReciever'][0],
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: "ariel",
                                          )),
                                    ],
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.all(7),
                    color: Colors.deepPurpleAccent,
                    child: Column(
                      children: [
                        Text(
                          snapshot.data['question2'],
                          style: TextStyle(
                            fontSize: 21,
                            color: Colors.orange,
                            fontFamily: "ariel",
                          ),
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            q2
                                ? Text(
                                    snapshot.data['ansSender'][1],
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontFamily: "ariel",
                                    ),
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        snapshot.data['ansSender'][1],
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontFamily: "ariel",
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Text(snapshot.data['ansReciever'][1],
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: "ariel",
                                          )),
                                    ],
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Score: " + matchScore.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.orange),
                  ),
                ],
              ));
        });
  }
}
