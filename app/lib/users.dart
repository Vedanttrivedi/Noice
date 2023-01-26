import 'package:flutter/material.dart';
import 'usermatch.dart';

class Users extends StatefulWidget {
  final List<UserMatch> alluser;
  Users({this.alluser});
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    print(this.widget.alluser.length.toString());
    return ListView.builder(
      itemCount: this.widget.alluser.length,
      itemBuilder: (context, index) {
        Text(this.widget.alluser[index].name);
      },
    );
  }
}
