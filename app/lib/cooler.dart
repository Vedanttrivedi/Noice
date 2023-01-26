import 'package:app/userclass.dart';
import 'package:flutter/material.dart';
import 'hobbybase.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Hobby1 extends StatefulWidget {
  @override
  _Hobby1State createState() => _Hobby1State();
}

class _Hobby1State extends State<Hobby1> {
  List<String> hob1 = [];
  List<String> hob2 = [];
  List<String> hob3 = [];

  //variables associated with box1
  String box1 = "Online";
  bool box1Choice = true; //default show online checkboxes
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;
  bool b4 = false;
  bool b5 = false;

  //variables associated with box2
  String box2 = "Online";
  bool box2Choice = true; //default show online checkboxes
  bool c1 = false;
  bool c2 = false;
  bool c3 = false;
  bool c4 = false;
  bool c5 = false;

  //variables associated with box3
  String box3 = "Outdoor";
  bool box3Choice = true; //default show online checkboxes
  bool d1 = false;
  bool d2 = false;
  bool d3 = false;
  bool d4 = false;
  bool d5 = false;
  bool d6 = false;
  bool d7 = false;
  bool d8 = false;
  bool d9 = false;
  bool d10 = false;
  bool d11 = false;

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              Container(
                color: Colors.orangeAccent,
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.all(7),
                child: Column(
                  children: [
                    Center(
                        child: Text("Reading",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white))),
                    Row(
                      children: [
                        Text("Online", style: TextStyle(fontSize: 25)),
                        Radio(
                          onChanged: (val) {
                            setState(() {
                              b3 = false;
                              b4 = false;
                              b5 = false;
                              box1Choice = !box1Choice;
                              box1 = val;
                            });
                          },
                          value: "Onlsaine",
                          groupValue: box1,
                        ),
                        Text("Offline", style: TextStyle(fontSize: 25)),
                        Radio(
                          onChanged: (val) {
                            setState(() {
                              box1 = val;
                              box1Choice = !box1Choice;
                              b1 = false;
                              b2 = false;
                              //b5 = false;
                            });
                          },
                          value: "Offline",
                          groupValue: box1,
                        ),
                      ],
                    ),
                    //row will be changed according to online and offline
                    box1Choice
                        ? Row(
                            children: [
                              Text("Blog/Article",
                                  style: TextStyle(fontSize: 18)),
                              Checkbox(
                                value: b1,
                                onChanged: (val) {
                                  setState(() {
                                    b1 = !b1;
                                  });
                                },
                              ),
                              Text("PDF", style: TextStyle(fontSize: 18)),
                              Checkbox(
                                value: b2,
                                onChanged: (val) {
                                  setState(() {
                                    setState(() {
                                      b2 = !b2;
                                    });
                                  });
                                },
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Text("StudyBooks",
                                  style: TextStyle(fontSize: 15)),
                              Checkbox(
                                value: b3,
                                onChanged: (val) {
                                  setState(() {
                                    b3 = !b3;
                                  });
                                },
                              ),
                              Text("Comics", style: TextStyle(fontSize: 15)),
                              Checkbox(
                                value: b4,
                                onChanged: (val) {
                                  setState(() {
                                    b4 = !b4;
                                  });
                                },
                              ),
                              Text("Novels", style: TextStyle(fontSize: 15)),
                              Checkbox(
                                value: b5,
                                onChanged: (val) {
                                  setState(() {
                                    b5 = !b5;
                                  });
                                },
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              //container for watching
              Container(
                color: Colors.deepPurpleAccent,
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.all(7),
                child: Column(
                  children: [
                    Center(
                        child: Text("Watching",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white))),
                    Row(
                      children: [
                        Text("Online", style: TextStyle(fontSize: 25)),
                        Radio(
                          onChanged: (val) {
                            setState(() {
                              box2 = val;
                              box2Choice = !box2Choice;
                              c3 = false;
                              c4 = false;
                              c5 = false;
                            });
                          },
                          value: "Online",
                          groupValue: box2,
                        ),
                        Text("Offline", style: TextStyle(fontSize: 25)),
                        Radio(
                          onChanged: (val) {
                            setState(() {
                              box2 = val;
                              box2Choice = !box2Choice;
                              c1 = false;
                              c2 = false;
                            });
                          },
                          value: "Offline",
                          groupValue: box2,
                        ),
                      ],
                    ),
                    box2Choice
                        ? Row(
                            children: [
                              Text("Youtube", style: TextStyle(fontSize: 18)),
                              Checkbox(
                                value: c1,
                                onChanged: (val) {
                                  setState(() {
                                    c1 = !c1;
                                  });
                                },
                              ),
                              Text("WebSeries", style: TextStyle(fontSize: 18)),
                              Checkbox(
                                value: c2,
                                onChanged: (val) {
                                  setState(() {
                                    setState(() {
                                      c2 = !c2;
                                    });
                                  });
                                },
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Text("Movie", style: TextStyle(fontSize: 18)),
                              Checkbox(
                                value: c3,
                                onChanged: (val) {
                                  setState(() {
                                    c3 = !c3;
                                  });
                                },
                              ),
                              Text("Tv", style: TextStyle(fontSize: 18)),
                              Checkbox(
                                value: c5,
                                onChanged: (val) {
                                  setState(() {
                                    c5 = !c5;
                                  });
                                },
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              //container for sports
              Container(
                color: Colors.pinkAccent,
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.all(7),
                child: Column(
                  children: [
                    Center(
                        child: Text("Sports",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white))),
                    Row(
                      children: [
                        Text("Outdoor", style: TextStyle(fontSize: 25)),
                        Radio(
                          onChanged: (val) {
                            setState(() {
                              box3 = val;
                              box3Choice = !box3Choice;

                              d7 = false;
                              d8 = false;
                              d9 = false;
                              d10 = false;
                              d11 = false;
                            });
                          },
                          value: "Outdoor",
                          groupValue: box3,
                        ),
                        Text("Indoor", style: TextStyle(fontSize: 25)),
                        Radio(
                          onChanged: (val) {
                            setState(() {
                              box3 = val;
                              box3Choice = !box3Choice;
                              d1 = false;
                              d2 = false;
                              d3 = false;
                              d4 = false;
                              d5 = false;
                              d6 = false;
                            });
                          },
                          value: "Indoor",
                          groupValue: box3,
                        ),
                      ],
                    ),
                    box3Choice
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Text("Hocky", style: TextStyle(fontSize: 16)),
                                  Checkbox(
                                    value: d1,
                                    onChanged: (val) {
                                      setState(() {
                                        d1 = !d1;
                                      });
                                    },
                                  ),
                                  Text("Cricket",
                                      style: TextStyle(fontSize: 16)),
                                  Checkbox(
                                    value: d2,
                                    onChanged: (val) {
                                      setState(() {
                                        setState(() {
                                          d2 = !d2;
                                        });
                                      });
                                    },
                                  ),
                                  Text("Badminton",
                                      style: TextStyle(fontSize: 16)),
                                  Checkbox(
                                    value: d3,
                                    onChanged: (val) {
                                      setState(() {
                                        setState(() {
                                          d3 = !d3;
                                        });
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Football",
                                      style: TextStyle(fontSize: 16)),
                                  Checkbox(
                                    value: d4,
                                    onChanged: (val) {
                                      setState(() {
                                        setState(() {
                                          d4 = !d4;
                                        });
                                      });
                                    },
                                  ),
                                  Text("kabaddi",
                                      style: TextStyle(fontSize: 16)),
                                  Checkbox(
                                    value: d5,
                                    onChanged: (val) {
                                      setState(() {
                                        setState(() {
                                          d5 = !d5;
                                        });
                                      });
                                    },
                                  ),
                                  Text("Maldadi",
                                      style: TextStyle(fontSize: 17)),
                                  Checkbox(
                                    value: d6,
                                    onChanged: (val) {
                                      setState(() {
                                        setState(() {
                                          d6 = !d6;
                                        });
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Text("Chess", style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    value: d8,
                                    onChanged: (val) {
                                      setState(() {
                                        d8 = !d8;
                                      });
                                    },
                                  ),
                                  Text("Carrom",
                                      style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    value: d9,
                                    onChanged: (val) {
                                      setState(() {
                                        d9 = !d9;
                                      });
                                    },
                                  ),
                                  Text("Ludo", style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    value: d10,
                                    onChanged: (val) {
                                      setState(() {
                                        d10 = !d10;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Cards", style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    value: d11,
                                    onChanged: (val) {
                                      setState(() {
                                        d11 = !d11;
                                      });
                                    },
                                  ),
                                  Text("Snake-Ladder",
                                      style: TextStyle(fontSize: 20)),
                                  Checkbox(
                                    value: d7,
                                    onChanged: (val) {
                                      setState(() {
                                        d7 = !d7;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                  ],
                ),
              ),

              RaisedButton(
                color: Colors.orange,
                padding: EdgeInsets.all(10),
                onPressed: () {
                  //reading hobby will be in list hob1
                  box1Choice ? hob1.add("Online") : hob1.add("Offline");
                  b1 ? hob1.add("Blog/Article") : print("cool");
                  b2 ? hob1.add("PDF") : print("cool");
                  b3 ? hob1.add("StudyBooks") : print("cool");
                  b4 ? hob1.add("Comics") : print("cool");
                  b5 ? hob1.add("Novels") : print("cool");
                  //watching hobby will be in list hob2
                  box2Choice ? hob2.add("Online") : hob2.add("Offline");
                  c1 ? hob2.add("Youtube") : print("cool");
                  c2 ? hob2.add("Webseries") : print("cool");
                  c3 ? hob2.add("Movie") : print("cool");
                  c4 ? hob2.add("Saved Offline Videos") : print("cool");
                  c5 ? hob2.add("Tv") : print("cool");
                  //sports hobby will be in list hob3
                  box3Choice ? hob3.add("Outdoor") : hob3.add("Indoor");
                  d1 ? hob3.add("Hocky") : print("cool");
                  d2 ? hob3.add("Cricket") : print("cool");
                  d3 ? hob3.add("Badminton") : print("cool");
                  d4 ? hob3.add("Football") : print("cool");
                  d5 ? hob3.add("Kabaddi") : print("cool");
                  d6 ? hob3.add("Maldadi") : print("cool");
                  d7 ? hob3.add("Snake-Ladder") : print("cool");
                  d8 ? hob3.add("Carrom") : print("cool");
                  d9 ? hob3.add("Ludo") : print("cool");
                  d10 ? hob3.add("Cards") : print("cool");
                  d11 ? hob3.add("Chess") : print("cool");
                  print("****************");
                  print(hob1);
                  print(hob2);
                  print(hob3);
/*
                  UserBase customuser = UserBase();
                  customuser.setUser(user.uid, hob1, hob2, hob3);

                  hob1 = [];
                  hob2 = [];
                  hob3 = [];*/
                },
                child: Text(
                  'Done',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ));
  }
}
