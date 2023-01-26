import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/usermodel.dart';

class UserList extends StatefulWidget {
  final List users;
  UserList({this.users});
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    print("inside userlist ");
    return ListView.builder(
        itemCount: this.widget.users.length,
        itemBuilder: (contex, index) {
          return Card(
            child: ListTile(
              title: Text("Noice"),
              subtitle: Text("1"),
            ),
          );
        });
  }
}
