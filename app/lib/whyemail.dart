import 'package:flutter/material.dart';

class WhyMail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Email"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
                "Only Reason We Ask For Email Is,If You Forget your login details(password and username) "),
            Text(
                "To Recover Your Account And Login Info(Password and Username)"),
            Text("If You can remember that than no need for email"),
            Text(
                "Because if your forget your details and have not updated your "),
            Text("email than you cannot recover it"),
            Text("Otherwise You can Skip Email")
          ],
        ),
      ),
    );
  }
}
