import 'package:app/userclass.dart';
import 'package:app/whyemail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'hobbybase.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Hobby extends StatefulWidget {
  @override
  _HobbyState createState() => _HobbyState();
}

class _HobbyState extends State<Hobby> {
  bool fav1 = true;
  bool fav2 = false;
  bool fav3 = false;
  bool fav4 = false;
  bool fav5 = false;

  List<String> hob1 = [];
  List<String> hob2 = [];
  List<String> hob3 = [];
  List<String> hob4 = [];
  List<String> hob5 = [];

  String first_name;
  String last_name;

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

  //variables associated with box4
  String box4 = "Mobile";
  bool box4Choice = true; //default show online checkboxes
  bool e1 = false;
  bool e2 = false;
  bool e3 = false;
  bool e4 = false;
  bool e5 = false;
  bool e6 = false;
  bool e7 = false;
  bool e8 = false;
  bool e9 = false;
  bool e10 = false;
  bool e11 = false;

  //variables associated with box4
  String box5 = "Spicy";
  bool box5Choice = true; //default show online checkboxes
  String box6choice = "Street Food";
  bool showStreetFood =
      true; //if spicy food is selected then default show street food
  bool f1 = false;
  bool f2 = false;
  bool f3 = false;
  bool f4 = false;
  bool f5 = false;
  bool f6 = false;
  bool f7 = false;
  bool f8 = false;
  bool f9 = false;
  bool f10 = false;
  bool f11 = false;
  bool f12 = false;
  bool g1 = false;
  bool g2 = false;
  bool g3 = false;
  bool g4 = false;
  bool g5 = false;
  //Colors box1color = Colors.white;
  bool box1Colors = false; //if box color is false than show white icon
  bool box2Colors = false; //if box color is false than show white icon
  bool box3Colors = false; //if box color is false than show white icon
  bool box4Colors = false; //if box color is false than show white icon
  bool box5Colors = false; //if box color is false than show white icon

  final formkeys = GlobalKey<FormState>();
  String email = "";
  String imageurl = "asset/vk.jpg";
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    Stream<DocumentSnapshot> snap =
        FirebaseFirestore.instance.collection('user').doc(user.uid).snapshots();
    if (snap != null) {
      return StreamBuilder<DocumentSnapshot>(
          stream: snap,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            bool isname = snapshot.data['isnamegiven'];
            print("username " + isname.toString());
            return isname
                ? Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    child: Form(
                      child: Column(
                        children: [
                          //reading box
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                  Colors.yellow,
                                  Colors.deepOrangeAccent
                                ])),
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.all(7),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 70),
                                    child: Row(
                                      children: [
                                        Text("Reading",
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.white,
                                            )),
                                        /*IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: fav1
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              fav1 = true;
                                              fav2 = false;
                                              fav3 = false;
                                              fav4 = false;
                                              fav5 = false;
                                            });
                                          },
                                        )*/
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Text("Online",
                                        style: TextStyle(fontSize: 25)),
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
                                      value: "Online",
                                      groupValue: box1,
                                    ),
                                    Text("Offline",
                                        style: TextStyle(fontSize: 25)),
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
                                          Text("PDF",
                                              style: TextStyle(fontSize: 18)),
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
                                              style: TextStyle(fontSize: 14)),
                                          Checkbox(
                                            value: b3,
                                            onChanged: (val) {
                                              setState(() {
                                                b3 = !b3;
                                              });
                                            },
                                          ),
                                          Text("Comics",
                                              style: TextStyle(fontSize: 13)),
                                          Checkbox(
                                            value: b4,
                                            onChanged: (val) {
                                              setState(() {
                                                b4 = !b4;
                                              });
                                            },
                                          ),
                                          Text("Novels",
                                              style: TextStyle(fontSize: 14)),
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
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Colors.purpleAccent,
                                  Colors.deepPurpleAccent
                                ])),
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.all(7),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 70),
                                    child: Row(
                                      children: [
                                        Text("Watching",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white)),
                                        /*IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: fav2
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              fav2 = true;
                                              fav1 = false;
                                              fav3 = false;
                                              fav4 = false;
                                              fav5 = false;
                                            });
                                          },
                                        )*/
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Text("Online",
                                        style: TextStyle(fontSize: 25)),
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
                                    Text("Offline",
                                        style: TextStyle(fontSize: 25)),
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
                                          Text("Youtube",
                                              style: TextStyle(fontSize: 18)),
                                          Checkbox(
                                            value: c1,
                                            onChanged: (val) {
                                              setState(() {
                                                c1 = !c1;
                                              });
                                            },
                                          ),
                                          Text("WebSeries",
                                              style: TextStyle(fontSize: 18)),
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
                                          Text("Movie",
                                              style: TextStyle(fontSize: 18)),
                                          Checkbox(
                                            value: c3,
                                            onChanged: (val) {
                                              setState(() {
                                                c3 = !c3;
                                              });
                                            },
                                          ),
                                          Text("Tv",
                                              style: TextStyle(fontSize: 18)),
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
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Colors.pink[300],
                                  Colors.pinkAccent[200]
                                ])),
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.all(7),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 70),
                                    child: Row(
                                      children: [
                                        Text("Sports",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white)),
                                        /*IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: fav3
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              fav1 = false;
                                              fav2 = false;
                                              fav3 = true;
                                              fav4 = false;
                                              fav5 = false;
                                            });
                                          },
                                        )*/
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Text("Outdoor",
                                        style: TextStyle(fontSize: 25)),
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
                                    Text("Indoor",
                                        style: TextStyle(fontSize: 25)),
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
                                              Text("Hocky",
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Checkbox(
                                                value: d1,
                                                onChanged: (val) {
                                                  setState(() {
                                                    d1 = !d1;
                                                  });
                                                },
                                              ),
                                              Text("Cricket",
                                                  style:
                                                      TextStyle(fontSize: 16)),
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
                                                  style:
                                                      TextStyle(fontSize: 14)),
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
                                                  style:
                                                      TextStyle(fontSize: 16)),
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
                                                  style:
                                                      TextStyle(fontSize: 14)),
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
                                                  style:
                                                      TextStyle(fontSize: 14)),
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
                                              Text("Chess",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Checkbox(
                                                value: d8,
                                                onChanged: (val) {
                                                  setState(() {
                                                    d8 = !d8;
                                                  });
                                                },
                                              ),
                                              Text("Carrom",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Checkbox(
                                                value: d9,
                                                onChanged: (val) {
                                                  setState(() {
                                                    d9 = !d9;
                                                  });
                                                },
                                              ),
                                              Text("Ludo",
                                                  style:
                                                      TextStyle(fontSize: 20)),
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
                                              Text("Cards",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Checkbox(
                                                value: d11,
                                                onChanged: (val) {
                                                  setState(() {
                                                    d11 = !d11;
                                                  });
                                                },
                                              ),
                                              Text("Snake-Ladder",
                                                  style:
                                                      TextStyle(fontSize: 20)),
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
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Colors.lightGreenAccent,
                                  Colors.greenAccent
                                ])),
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.all(7),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 40),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text("Gaming",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white)),
                                      ],
                                    )),
                                Row(
                                  children: [
                                    Text("Mobile",
                                        style: TextStyle(fontSize: 25)),
                                    Radio(
                                      onChanged: (val) {
                                        setState(() {
                                          box4 = val;
                                          box4Choice = !box4Choice;

                                          e7 = false;
                                          e8 = false;
                                          e9 = false;
                                          e10 = false;
                                          e11 = false;
                                        });
                                      },
                                      value: "Mobile",
                                      groupValue: box4,
                                    ),
                                    Text("PC", style: TextStyle(fontSize: 25)),
                                    Radio(
                                      onChanged: (val) {
                                        setState(() {
                                          box4 = val;
                                          box4Choice = !box4Choice;
                                          e1 = false;
                                          e2 = false;
                                          e3 = false;
                                          e4 = false;
                                          e5 = false;
                                          e6 = false;
                                        });
                                      },
                                      value: "PC",
                                      groupValue: box4,
                                    ),
                                  ],
                                ),
                                box4Choice
                                    ? Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("COD",
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Checkbox(
                                                value: e1,
                                                onChanged: (val) {
                                                  setState(() {
                                                    e1 = !e1;
                                                  });
                                                },
                                              ),
                                              Text("PUBG",
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Checkbox(
                                                value: e2,
                                                onChanged: (val) {
                                                  setState(() {
                                                    setState(() {
                                                      e2 = !e2;
                                                    });
                                                  });
                                                },
                                              ),
                                              Text("FREEFIRE",
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                              Checkbox(
                                                value: e3,
                                                onChanged: (val) {
                                                  setState(() {
                                                    setState(() {
                                                      e3 = !e3;
                                                    });
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("COC",
                                                  style:
                                                      TextStyle(fontSize: 16)),
                                              Checkbox(
                                                value: e4,
                                                onChanged: (val) {
                                                  setState(() {
                                                    setState(() {
                                                      e4 = !e4;
                                                    });
                                                  });
                                                },
                                              ),
                                              Text("MINIMILITIA",
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Checkbox(
                                                value: e5,
                                                onChanged: (val) {
                                                  setState(() {
                                                    setState(() {
                                                      e5 = !e5;
                                                    });
                                                  });
                                                },
                                              ),
                                              Text("ASPHALT",
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                              Checkbox(
                                                value: e6,
                                                onChanged: (val) {
                                                  setState(() {
                                                    setState(() {
                                                      e6 = !e6;
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
                                          Text(
                                              "These are gaming series not individual games"),
                                          Row(
                                            children: [
                                              Text("GTA",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Checkbox(
                                                value: e8,
                                                onChanged: (val) {
                                                  setState(() {
                                                    e8 = !e8;
                                                  });
                                                },
                                              ),
                                              Text("COD",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Checkbox(
                                                value: e9,
                                                onChanged: (val) {
                                                  setState(() {
                                                    e9 = !e9;
                                                  });
                                                },
                                              ),
                                              Text("NFS",
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                              Checkbox(
                                                value: e10,
                                                onChanged: (val) {
                                                  setState(() {
                                                    e10 = !e10;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("COUNTERSTRIKE",
                                                  style:
                                                      TextStyle(fontSize: 15)),
                                              Checkbox(
                                                value: e11,
                                                onChanged: (val) {
                                                  setState(() {
                                                    e11 = !e11;
                                                  });
                                                },
                                              ),
                                              Text("EASPORTS",
                                                  style:
                                                      TextStyle(fontSize: 18)),
                                              Checkbox(
                                                value: e7,
                                                onChanged: (val) {
                                                  setState(() {
                                                    e7 = !e7;
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
                          Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                  Colors.yellow,
                                  Colors.deepOrangeAccent
                                ])),
                            padding: EdgeInsets.all(7),
                            margin: EdgeInsets.all(7),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Text("FOOD",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Spicy",
                                        style: TextStyle(fontSize: 25)),
                                    Radio(
                                      onChanged: (val) {
                                        setState(() {
                                          box5 = val;
                                          box5Choice = !box5Choice;

                                          f7 = false;
                                          f8 = false;
                                          f9 = false;
                                          f10 = false;
                                          f11 = false;
                                          g1 = false;
                                          g2 = false;
                                          g3 = false;
                                          g4 = false;
                                          g5 = false;
                                        });
                                      },
                                      value: "Spicy",
                                      groupValue: box5,
                                    ),
                                    Text("Sweet",
                                        style: TextStyle(fontSize: 25)),
                                    Radio(
                                      onChanged: (val) {
                                        setState(() {
                                          box5 = val;
                                          box5Choice = !box5Choice;
                                          f1 = false;
                                          f2 = false;
                                          f3 = false;
                                          f4 = false;
                                          f5 = false;
                                          f6 = false;
                                        });
                                      },
                                      value: "Sweet",
                                      groupValue: box5,
                                    ),
                                  ],
                                ),
                                box5Choice
                                    ? Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("Street Food",
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                              Radio(
                                                value: "Street Food",
                                                onChanged: (val) {
                                                  setState(() {
                                                    box6choice = val;
                                                    showStreetFood = true;
                                                    g1 = false;
                                                    g2 = false;
                                                    g3 = false;
                                                    g4 = false;
                                                    g5 = false;
                                                    //f6 = false;
                                                  });
                                                },
                                                groupValue: box6choice,
                                              ),
                                              Text("Restaurant",
                                                  style:
                                                      TextStyle(fontSize: 14)),
                                              Radio(
                                                groupValue: box6choice,
                                                value: "Restaurant",
                                                onChanged: (val) {
                                                  setState(() {
                                                    setState(() {
                                                      box6choice = val;
                                                      showStreetFood = false;
                                                      f1 = false;
                                                      f2 = false;
                                                      f3 = false;
                                                      f4 = false;
                                                      f5 = false;
                                                      f6 = false;
                                                    });
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 0),
                                          showStreetFood
                                              ? Container(
                                                  /* for street food*/
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("DABELI",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: f1,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                f1 = !f1;
                                                              });
                                                            },
                                                          ),
                                                          Text("VADAPAV",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: f2,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                f2 = !f2;
                                                              });
                                                            },
                                                          ),
                                                          Text("PANIPURI",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: f3,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                f3 = !f3;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text("BHEL",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: f4,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                f4 = !f4;
                                                              });
                                                            },
                                                          ),
                                                          Text("PUFF",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: f5,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                f5 = !f5;
                                                              });
                                                            },
                                                          ),
                                                          Text("SANDWICH",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: f6,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                f6 = !f6;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : Container(
                                                  /*for restaurent */
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text("GUJARATI",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10)),
                                                          Checkbox(
                                                            value: g1,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                g1 = !g1;
                                                              });
                                                            },
                                                          ),
                                                          Text("PUNJABI",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10)),
                                                          Checkbox(
                                                            value: g2,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                g2 = !g2;
                                                              });
                                                            },
                                                          ),
                                                          Text("SOUTHINDIAN",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10)),
                                                          Checkbox(
                                                            value: g3,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                g3 = !g3;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text("CHINESE",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: g4,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                g4 = !g4;
                                                              });
                                                            },
                                                          ),
                                                          Text("MEXICAN",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          Checkbox(
                                                            value: g5,
                                                            onChanged: (val) {
                                                              setState(() {
                                                                g5 = !g5;
                                                              });
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text("SHIRA",
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Checkbox(
                                                value: f8,
                                                onChanged: (val) {
                                                  setState(() {
                                                    f8 = !f8;
                                                  });
                                                },
                                              ),
                                              Text("SHRIKHAND",
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Checkbox(
                                                value: f9,
                                                onChanged: (val) {
                                                  setState(() {
                                                    f9 = !f9;
                                                  });
                                                },
                                              ),
                                              Text("RASGULLA",
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Checkbox(
                                                value: f10,
                                                onChanged: (val) {
                                                  setState(() {
                                                    f10 = !f10;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("GULABJAMUN",
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Checkbox(
                                                value: f11,
                                                onChanged: (val) {
                                                  setState(() {
                                                    f11 = !f11;
                                                  });
                                                },
                                              ),
                                              Text("RABADI",
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Checkbox(
                                                value: f12,
                                                onChanged: (val) {
                                                  setState(() {
                                                    f12 = !f12;
                                                  });
                                                },
                                              ),
                                              Text("BASUDI",
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              Checkbox(
                                                value: f7,
                                                onChanged: (val) {
                                                  setState(() {
                                                    f7 = !f7;
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
                            padding: EdgeInsets.all(15),
                            onPressed: () {
                              //reading hobby will be in list hob1
                              box1Choice
                                  ? hob1.add("Online")
                                  : hob1.add("Offline");
                              b1 ? hob1.add("Blog/Article") : print("cool");
                              b2 ? hob1.add("PDF") : print("cool");
                              b3 ? hob1.add("StudyBooks") : print("cool");
                              b4 ? hob1.add("Comics") : print("cool");
                              b5 ? hob1.add("Novels") : print("cool");
                              //watching hobby will be in list hob2
                              box2Choice
                                  ? hob2.add("Online")
                                  : hob2.add("Offline");
                              c1 ? hob2.add("Youtube") : print("cool");
                              c2 ? hob2.add("Webseries") : print("cool");
                              c3 ? hob2.add("Movie") : print("cool");
                              c4
                                  ? hob2.add("Saved Offline Videos")
                                  : print("cool");
                              c5 ? hob2.add("Tv") : print("cool");
                              //sports hobby will be in list hob3
                              box3Choice
                                  ? hob3.add("Outdoor")
                                  : hob3.add("Indoor");
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
                              //gaming hobby will be in list hob4
                              box4Choice ? hob4.add("Mobile") : hob4.add("PC");
                              e1 ? hob4.add("COD") : print("cool");
                              e2 ? hob4.add("PUBG") : print("cool");
                              e3 ? hob4.add("FREEFIRE") : print("cool");
                              e4 ? hob4.add("COC") : print("cool");
                              e5 ? hob4.add("MINIMILITIA") : print("cool");
                              e6 ? hob4.add("ASPHALT") : print("cool");
                              e7 ? hob4.add("EASPORTS") : print("cool");
                              e8 ? hob4.add("GTA") : print("cool");
                              e9 ? hob4.add("COD") : print("cool");
                              e10 ? hob4.add("NFS") : print("cool");
                              e11 ? hob4.add("COUNTERSTRIKE") : print("cool");
                              //food hobby will be in list hob4
                              box5Choice
                                  ? hob5.add("Spicy")
                                  : hob5.add("Sweet");
                              if (box5Choice) {
                                if (showStreetFood)
                                  showStreetFood
                                      ? {hob5.add("Street Food")}
                                      : hob5.add("Restaurent");
                              }
                              g1 ? hob5.add("GUJARATI") : print("cool");
                              g2 ? hob5.add("PUNJABI") : print("cool");
                              g3 ? hob5.add("SOUTHINDIAN") : print("cool");
                              g4 ? hob5.add("CHINESE") : print("cool");
                              g5 ? hob5.add("MEXICAN") : print("cool");

                              f1 ? hob5.add("DABELI") : print("cool");
                              f2 ? hob5.add("VADAPAV") : print("cool");
                              f3 ? hob5.add("PANIPURI") : print("cool");
                              f4 ? hob5.add("BHEL") : print("cool");
                              f5 ? hob5.add("PUFF") : print("cool");
                              f6 ? hob5.add("SENDWICH") : print("cool");
                              f8 ? hob5.add("SHIRA") : print("cool");
                              f9 ? hob5.add("SHRIKHAND") : print("cool");
                              f10 ? hob5.add("RASGULLA") : print("cool");
                              f11 ? hob5.add("GULABJAMUN") : print("cool");
                              f12 ? hob5.add("RABADI") : print("cool");
                              f7 ? hob5.add("BASUDI") : print("cool");

                              print("****************");
                              print(hob1);
                              print(hob2);
                              print(hob3);
                              String favs = "";
                              if (fav1) {
                                favs = "Reading";
                              } else if (fav2) {
                                favs = "Watching";
                              } else if (fav3) {
                                favs = "Sports";
                              } else if (fav4) {
                                favs = "Gaming";
                              } else if (fav5) {
                                favs = "Food";
                              }

                              UserBase customuser = UserBase();
                              customuser.setUser(
                                  user.uid, hob1, hob2, hob3, hob4, hob5, favs);
                              print("ew");
                              hob1 = [];
                              hob2 = [];
                              hob3 = [];
                              hob4 = [];
                              hob5 = [];
                            },
                            child: Text(
                              'Match',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ))
                : Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.all(10),
                    child: Form(
                      key: formkeys,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 20),
                                child: Text(
                                  "Hii " +
                                      snapshot.data['name'] +
                                      " Your Account is Created",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("One Step Away ",
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 7,
                          ),
                          Text(" Just Update Your Info",
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return "field is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "First Name",
                              errorBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.red, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.deepPurpleAccent,
                                      width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.red, width: 2.0)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val.isEmpty) {
                                return "field is required";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Last Name",
                              errorBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.red, width: 2.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.orange, width: 2.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.deepPurpleAccent,
                                      width: 2.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                      color: Colors.red, width: 2.0)),
                            ),
                          ),
                          Text(
                            "Choose Avatar",
                            style: TextStyle(fontSize: 20),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/vk.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                        value: "asset/vk.jpg",
                                        groupValue: imageurl,
                                        onChanged: (val) {
                                          setState(() {
                                            imageurl = val;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/sr.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/sr.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/ms.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/ms.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/thor.png',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/thor.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/iron.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/iron.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/hulkjpg.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/hulkjpg.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/alia.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/alia.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/dakota.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/dakota.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        'asset/emma.jpg',
                                        width: 100,
                                        height: 180,
                                      ),
                                      Radio(
                                          value: "asset/emma.jpg",
                                          groupValue: imageurl,
                                          onChanged: (val) {
                                            setState(() {
                                              imageurl = val;
                                            });
                                          }),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: RaisedButton(
                              onPressed: () {
                                if (formkeys.currentState.validate()) {
                                  FirebaseFirestore.instance
                                      .collection('user')
                                      .doc(user.uid)
                                      .update({
                                    'first_name': first_name,
                                    'last_name': last_name,
                                    'isnamegiven': true,
                                    'image': imageurl
                                  });
                                }
                              },
                              child: Text("Update"),
                            ),
                          ),
                          /*FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WhyMail()));
                            },
                            child: Text("Why Email"),
                            color: Colors.blue,
                          )*/
                        ],
                      ),
                    ),
                  );
          });
    }
  }
}
