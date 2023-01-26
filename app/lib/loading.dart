import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Connecting to firebase please wait',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
            ),
          ),
        ));
  }
}
