import 'package:app/bdm-template.dart';
import 'package:app/kookabura-template.dart';
import 'package:app/sg-template.dart';
import 'package:app/ss-template.dart';
import 'package:flutter/material.dart';

class ShowTemplates extends StatefulWidget {
  final String collabusername;
  ShowTemplates(this.collabusername);
  @override
  _ShowTemplatesState createState() => _ShowTemplatesState();
}

class _ShowTemplatesState extends State<ShowTemplates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Templates For Collab",
            style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: [
              Text(
                "Choose Template",
                style: TextStyle(color: Colors.orange, fontSize: 22),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SgTemplate(
                              collabuser: this.widget.collabusername)));
                },
                color: Colors.amber,
                child: Container(
                    padding: EdgeInsets.all(55),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/sg.png',
                          width: 200,
                          height: 150,
                        ),
                        Text("SG Template",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text("One Radio Button",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Text("One checkbox ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                        Text("One text Field",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    )),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SsTemplate()));
                },
                color: Colors.tealAccent,
                child: Container(
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/ss.png',
                          width: 200,
                          height: 150,
                        ),
                        Text("SS Template",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text(
                            "Three Radio Button(User Can Select Only One Option)",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    )),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BdmTemplate()));
                },
                color: Colors.pinkAccent,
                child: Container(
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/bdm.png',
                          width: 200,
                          height: 150,
                        ),
                        Text("BDM Template",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text(
                            "Three checkbox(User Can Select multiple Options) ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    )),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => KookaburaTemplate()));
                },
                color: Colors.blue,
                child: Container(
                    padding: EdgeInsets.all(14),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/kk.png',
                          width: 200,
                          height: 150,
                        ),
                        Text("KOOKABURA Template",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text("Three text Field(User Can Answer In Brief)",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
