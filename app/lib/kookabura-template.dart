import 'package:flutter/material.dart';

class KookaburaTemplate extends StatefulWidget {
  @override
  _KookaburaTemplateState createState() => _KookaburaTemplateState();
}

class _KookaburaTemplateState extends State<KookaburaTemplate> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KOOKABURA Template"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Caption Of The Collab",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.yellow, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.yellow, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "User Can Select Only One Option",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "1)",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText:
                        "ASK  1(exa:why virat kohli is better than rohit sharma??)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.orange, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.orange, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText:
                        "ASK  2(exa:what do you want to do in your life)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.orange, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.orange, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "field is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "ASK  3(exa:why you use telegram??)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.orange, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.orange, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                    } else {}
                  },
                  child: Text("Confirm"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
