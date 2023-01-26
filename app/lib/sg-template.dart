import 'package:app/sgsubmit.dart';
import 'package:app/submitsg.dart';
import 'package:flutter/material.dart';

class SgTemplate extends StatefulWidget {
  final String collabuser;
  SgTemplate({this.collabuser});
  @override
  _SgTemplateState createState() => _SgTemplateState();
}

class _SgTemplateState extends State<SgTemplate> {
  final formkey = GlobalKey<FormState>();
  String title;
  String question1;
  String question2;
  String question3;
  String option1;
  String option2;
  String option3;
  String option4;
  String option5;
  String option6;

  String collabuser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SG Template"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Text(
                  "Collab with " + this.widget.collabuser,
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
                    title = val;
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
                Text(
                  "1)User Can Select Only One Option",
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
                    question1 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "ASK  1(exa:which is your favourite chocalate)",
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
                    option1 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Option 1 for Ask1(exa:melody)",
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
                    option2 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Option 2 for Ask1(exa:kaccha mango)",
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
                    option3 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Option 3 for Ask1(exa:eclairs)",
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
                  "2)User Can Select Multiple Option",
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
                    question2 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "ASK  2(exa:spicy foods you like)",
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
                    option4 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Option 1 for Ask2(exa:panipuri)",
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
                    option5 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Option 2 for Ask2(exa:dabeli)",
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
                    option6 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Option 3 for Ask2(exa:vadapav)",
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
                    option4 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Option 4 for Ask2(exa:bhel)",
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
                  "3)User Can give Answer In Brief",
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
                    question3 = val;
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "ASK3 (exa:favourite quote)",
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
                RaisedButton(
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SgSubmit(
                                    title: title,
                                    question1: question1,
                                    question2: question2,
                                    question3: question3,
                                    option1: option1,
                                    option2: option2,
                                    option3: option3,
                                    option4: option4,
                                    option5: option5,
                                    option6: option6,
                                    collabuser: this.widget.collabuser,
                                  )));
                    } else {}
                  },
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                  padding: EdgeInsets.all(15),
                  color: Colors.deepPurpleAccent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
