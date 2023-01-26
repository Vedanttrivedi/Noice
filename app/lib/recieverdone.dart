import 'package:app/collabclass.dart';
import 'package:app/showmatch.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecieverDone extends StatefulWidget {
  String collabId;
  int t = 20;
  RecieverDone({this.collabId});
  @override
  _RecieverDoneState createState() => _RecieverDoneState();
}

class _RecieverDoneState extends State<RecieverDone> {
  @override
  Widget build(BuildContext context) {
    CollectionReference col = FirebaseFirestore.instance.collection('collab');
    String g = col.doc(this.widget.collabId).id;
    Stream<DocumentSnapshot> snap = FirebaseFirestore.instance
        .collection('collab')
        .doc(this.widget.collabId)
        .snapshots();

    return StreamBuilder<DocumentSnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          String opt1 = snapshot.data['choice1'];
          String opt2 = snapshot.data['choice4'];

          return Scaffold(
              appBar: AppBar(title: Text("cool")),
              body: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    children: [
                      Text(snapshot.data['topic'],
                          style: TextStyle(
                              color: Colors.deepPurpleAccent, fontSize: 18)),
                      Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.orange,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                        child: Column(children: [
                          Text(snapshot.data['question1'].toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          Row(
                            children: [
                              Text(snapshot.data['choice1']),
                              Radio(
                                onChanged: (val) {
                                  setState(() {
                                    opt1 = val;
                                  });
                                },
                                groupValue: opt1,
                                value: snapshot.data['choice1'],
                              ),
                              Text(snapshot.data['choice2']),
                              Radio(
                                onChanged: (val) {
                                  setState(() {
                                    opt1 = val;
                                  });
                                },
                                groupValue: opt1,
                                value: snapshot.data['choice2'],
                              ),
                              Text(snapshot.data['choice3']),
                              Radio(
                                onChanged: (val) {
                                  setState(() {
                                    opt1 = val;
                                  });
                                },
                                groupValue: opt1,
                                value: snapshot.data['choice3'],
                              ),
                            ],
                          )
                        ]),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.deepPurpleAccent,
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                        child: Column(children: [
                          Text(snapshot.data['question2'].toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                          Row(
                            children: [
                              Text(snapshot.data['choice4']),
                              Radio(
                                onChanged: (val) {
                                  setState(() {
                                    opt1 = val;
                                  });
                                },
                                groupValue: opt1,
                                value: snapshot.data['choice5'],
                              ),
                              Text(snapshot.data['choice5']),
                              Radio(
                                onChanged: (val) {
                                  setState(() {
                                    opt1 = val;
                                  });
                                },
                                groupValue: opt1,
                                value: snapshot.data['choice6'],
                              ),
                              Text(snapshot.data['choice6']),
                              Radio(
                                onChanged: (val) {
                                  setState(() {
                                    opt1 = val;
                                  });
                                },
                                groupValue: opt1,
                                value: snapshot.data['choice3'],
                              ),
                            ],
                          )
                        ]),
                      ),
                      RaisedButton(
                        child: Text("Match"),
                        onPressed: () {
                          FirebaseFirestore.instance
                              .collection('collab')
                              .doc(this.widget.collabId)
                              .update({
                            'ansReciever': [
                              snapshot.data['choice2'],
                              snapshot.data['choice4']
                            ],
                            'recieverdone': true,
                          });

                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(snapshot.data['senderUid'])
                              .update({
                            'sender':
                                FieldValue.arrayRemove([this.widget.collabId])
                          });
                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(snapshot.data['senderUid'])
                              .update({
                            'dones':
                                FieldValue.arrayUnion([this.widget.collabId])
                          });

                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(snapshot.data['recieverUid'])
                              .update({
                            'reciever':
                                FieldValue.arrayRemove([this.widget.collabId])
                          });
                          FirebaseFirestore.instance
                              .collection('user')
                              .doc(snapshot.data['recieverUid'])
                              .update({
                            'dones':
                                FieldValue.arrayUnion([this.widget.collabId])
                          });

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowMatch(
                                      collaid: this.widget.collabId)));
                        },
                      )
                    ],
                  )));
        });
  }
}
