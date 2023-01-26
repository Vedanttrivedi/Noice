import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SendCollab extends StatefulWidget {
  @override
  _SendCollabState createState() => _SendCollabState();
}

class _SendCollabState extends State<SendCollab> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    Stream<DocumentSnapshot> snap =
        FirebaseFirestore.instance.collection('user').doc(user.uid).snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          final list = snapshot.data['sender'];

          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      snapshot.data['sender'].toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(35),
                    color: Colors.lightBlue,
                  )
                ],
              ),
            ),
          );
        });
  }
}
