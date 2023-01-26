import 'package:flutter/material.dart';

class WhyAccount extends StatelessWidget {
  final Function change;
  WhyAccount({this.change});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Why Create Account"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("this is just beta app"),
            Text(
                "In Future when are planning about so many updates where you can truly connect with your friends and family "),
            Text(""),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text("GO back"),
              onPressed: () {
                this.change(2);
              },
            )
          ],
        ),
      ),
    );
  }
}
