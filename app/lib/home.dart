import 'package:app/authmodel.dart';
import 'package:app/cooler.dart';
import 'package:app/hobby-form.dart';
import 'package:app/hobbymatch.dart';
import 'package:app/imagepicker.dart';
import 'package:app/newhobby.dart';
import 'package:app/profile.dart';
import 'package:app/silvers.dart';
import 'package:app/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'userlist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isblack = true;
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    AuthService auth = AuthService();

    Stream<DocumentSnapshot> snap =
        FirebaseFirestore.instance.collection('user').doc(user.uid).snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          var name = snapshot.data['name'];
          var gender = snapshot.data['gender'];

          var hobbydone = snapshot.data['hobbyDone'];
          bool isnamegiven = snapshot.data['isnamegiven'];
          print(snapshot.data['isnamegiven'].toString() + 'hello');
          return hobbydone
              ? HobbyMatch()
              : Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text("Hii " + name),
                    actions: [
                      IconButton(
                        onPressed: () {
                          //auth.signOutGoogle();
                        },
                        icon: Icon(Icons.add),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [Hobby()],
                    ),
                  ), /*
                  floatingActionButton: FloatingActionButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text("++"),
                      splashColor: Colors.deepPurpleAccent,
                      focusColor: Colors.deepPurpleAccent),*/
                );
        });
  }
}
