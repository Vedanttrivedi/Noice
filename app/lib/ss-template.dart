import 'package:flutter/material.dart';

class SsTemplate extends StatefulWidget {
  @override
  _SsTemplateState createState() => _SsTemplateState();
}

class _SsTemplateState extends State<SsTemplate> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SS Template"),
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
                    labelText: "ASK  1(exa:favourite spicy food you like)",
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
                    labelText: "Option 1 for Ask1(exa:panipuri)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
                    labelText: "Option 2 for Ask1(exa:dabeli)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
                    labelText: "Option 3 for Ask1(exa:vadapav)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
                Text(
                  "2)",
                  style: TextStyle(fontSize: 20),
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
                    labelText: "ASK  2(exa:favourite  category of games )",
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
                    labelText: "Option 1 for Ask2(exa:shooting)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
                    labelText: "Option 2 for Ask2(exa:racing)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
                    labelText: "Option 3 for Ask2(exa:sports)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "3)",
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
                    labelText: "ASK  3(exa:favourite comedy movies )",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.orange, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
                    labelText: "Option 1 for Ask3(exa:dhamaal)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
                    labelText: "Option 2 for Ask3(exa:phir hera pheri)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
                    labelText: "Option 3 for Ask3(exa:welcome)",
                    errorBorder: OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.red, width: 2.0)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Colors.deepPurpleAccent, width: 2.0)),
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
