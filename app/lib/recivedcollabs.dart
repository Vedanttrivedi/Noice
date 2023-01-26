import 'package:app/recieverdone.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecievedCollabs extends StatefulWidget {
  @override
  _RecievedCollabsState createState() => _RecievedCollabsState();
}

class _RecievedCollabsState extends State<RecievedCollabs> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    Stream<DocumentSnapshot> snap =
        FirebaseFirestore.instance.collection('user').doc(user.uid).snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          bool decide = false;
          if (snapshot.data['reciever'].length != 0) {
            decide = true;
          }
          return decide
              ? Scaffold(
                  appBar: AppBar(),
                  body: ListView.builder(
                    itemCount: snapshot.data['reciever'].length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: RaisedButton(
                          child: Text(snapshot.data['reciever'][index]),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RecieverDone(
                                        collabId: snapshot.data['reciever']
                                            [index])));
                          },
                        ),
                      );
                    },
                  ))
              : Scaffold(
                  appBar: AppBar(
                      title: Text("Recieved Collabs"),
                      backgroundColor: Colors.deepPurpleAccent),
                  body: Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(5),
                    child: Text(
                      "You do not have recieved collabs",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                );
        });
  }
}
