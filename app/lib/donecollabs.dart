import 'package:app/recieverdone.dart';
import 'package:app/showmatch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoneCollabs extends StatefulWidget {
  final List dones;
  DoneCollabs({this.dones});
  @override
  _DoneCollabsState createState() => _DoneCollabsState();
}

class _DoneCollabsState extends State<DoneCollabs> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    //getting all the collabs from the firebase
    Stream<QuerySnapshot> snaps =
        FirebaseFirestore.instance.collection('collab').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: snaps,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<String> recieved_titles = [];
          List<String> sended_titles = [];
          bool decide = false;
          if (this.widget.dones != 0) {
            decide = true;
          }
          var list = snapshot.data.docs;
          for (int i = 0; i < this.widget.dones.length; i++) {
            for (int j = 0; j < list.length; j++) {
              if (this.widget.dones[i] == list[j].id) {
                if (list[j]['senderUid'] == user.uid) {
                  sended_titles.add(list[j]['question1']);
                  break;
                }
                if (list[j]['recieverUid'] == user.uid) {
                  recieved_titles.add(list[j]['question1']);
                  break;
                }
              }
            }
          }
          return decide
              ? Scaffold(
                  appBar: AppBar(
                    title: Text("Finish Collabs"),
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  body: Container(
                    child: ListView.builder(
                        itemCount: sended_titles.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: RaisedButton(
                              padding: EdgeInsets.all(15),
                              onPressed: () {},
                              color: Colors.blueAccent,
                              child: Text(
                                sended_titles[index],
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          );
                        }),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                      title: Text("Recieved Collabs"),
                      backgroundColor: Colors.deepPurpleAccent),
                  body: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "You do not have Finished collabs",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
        });
  }
}
