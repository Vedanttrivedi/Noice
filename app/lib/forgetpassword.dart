import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'authmodel.dart';

class ResetAccount extends StatefulWidget {
  @override
  _ResetAccountState createState() => _ResetAccountState();
}

class _ResetAccountState extends State<ResetAccount> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> snap =
        FirebaseFirestore.instance.collection('user').snapshots();
    AuthService auth = AuthService();
    String id;
    String message = "";
    bool gotme = false;
    if (snap != null) {
      final formkey = GlobalKey<FormState>();
      return StreamBuilder<QuerySnapshot>(
          stream: snap,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            final list = snapshot.data.docs;
            return Scaffold(
              appBar: AppBar(),
              body: Container(
                child: Column(
                  children: [
                    Form(
                      key: formkey,
                      child: TextFormField(
                        validator: (val) {
                          if (val.isEmpty) {
                            return "key is required";
                          }
                          id = val;
                          return null;
                        },
                        decoration:
                            InputDecoration(labelText: "Enter the Secret Key"),
                      ),
                    ),
                    RaisedButton(
                      child: Text("Find My Account"),
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          //auth.resetPassword(id);
                        }
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      message,
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
}
