import 'package:app/authmodel.dart';
import 'package:app/usermatch.dart';
import 'package:app/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:app/hobbymatch.dart';

//page that shows match profiles
class HobbyMatch extends StatefulWidget {
  @override
  _HobbyMatchState createState() => _HobbyMatchState();
}

class _HobbyMatchState extends State<HobbyMatch> {
  Stream<QuerySnapshot> snap =
      FirebaseFirestore.instance.collection('user').snapshots();
  List<UserMatch> users = List<UserMatch>();
  List<UserMatch> users1 = List<UserMatch>() ?? [];
  List<UserMatch> users2 = [
    UserMatch(
        firstName: "mukesh",
        gender: "Male",
        lastName: "tiwary",
        name: "abcd",
        matchCount: 4),
    UserMatch(
        firstName: "hukesh",
        gender: "Male",
        lastName: "tiwary",
        name: "abcd",
        matchCount: 4),
    UserMatch(
        firstName: "bukesh",
        gender: "Male",
        lastName: "tiwary",
        name: "abcd",
        matchCount: 4),
    UserMatch(
        firstName: "vukesh",
        gender: "Male",
        lastName: "tiwary",
        name: "abcd",
        matchCount: 4),
  ];

  bool isblack = false;
  void changeList(String s) {
    setState(() {
      users1 = users1.where((element) {
        var name = element.firstName.toLowerCase();
        return name.contains(s.toLowerCase());
      }).toList();
      print("garry vs ash " + users1.length.toString());
      if (users1.length == 0) {
        print('no user found with this search');
        this.users1 = this.users;
      }
    });
  }

  @override
  void initState() {
    setState(() {
      super.initState();
    });
  }

  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    final User user = Provider.of<User>(context);

    String name = "";
    String gender = "";
    String fname;
    String lname;
    String search = "";
    String main_matches1 = "Reading";
    String main_matches2 = "FOOD";
    List<String> hob1 = [];
    List<String> hob2 = [];
    List<String> hob3 = [];
    List<String> hob4 = [];
    List<String> hob5 = [];

    var m = [];
    if (snap != null) {
      return StreamBuilder<QuerySnapshot>(
          stream: snap,
          builder: (context, snapshot) {
            var n = snapshot.data;
            var f = n.docs ?? [];
            users1 = [];
            users = [];
            for (int i = 0; i < f.length; i++) {
              if (user.email == f[i]['email']) {
                name = f[i]['name'];
                gender = f[i]['gender'];
                for (int j = 0; j < f[i]['hobby1'].length; j++)
                  hob1.add(f[i]['hobby1'][j]);
                for (int k = 0; k < f[i]['hobby2'].length; k++)
                  hob2.add(f[i]['hobby2'][k]);
                for (int m = 0; m < f[i]['hobby3'].length; m++)
                  hob3.add(f[i]['hobby3'][m]);
                for (int m = 0; m < f[i]['hobby4'].length; m++)
                  hob4.add(f[i]['hobby4'][m]);
                for (int m = 0; m < f[i]['hobby5'].length; m++)
                  hob5.add(f[i]['hobby5'][m]);

                break;
              }
            }
            int counter1 = 0;
            for (int i = 0; i < f.length; i++) {
              int counter = 0;
              if (user.email != f[i]['email']) {
                //matching reading list
                for (int j = 0; j < hob1.length; j++) {
                  try {
                    if (hob1[j] == f[i]['hobby1'][j]) {
                      counter += 1;
                      counter1 += 1;
                    }
                  } catch (e) {}
                }
                //matching watching list
                int counter2 = 0;
                for (int j = 0; j < hob2.length; j++) {
                  try {
                    if (hob2[j] == f[i]['hobby2'][j]) {
                      counter += 1;
                      counter2 += 1;
                    }
                  } catch (e) {}
                }
                int counter3 = 0;
                //matching sports list
                for (int j = 0; j < hob3.length; j++) {
                  try {
                    if (hob3[j] == f[i]['hobby3'][j]) {
                      counter += 1;
                      counter3 += 1;
                    }
                  } catch (e) {}
                }
                int counter4 = 0;
                //matching gaming list
                for (int j = 0; j < hob4.length; j++) {
                  try {
                    if (hob4[j] == f[i]['hobby4'][j]) {
                      counter += 1;
                      counter4 += 1;
                    }
                  } catch (e) {}
                }
                int counter5 = 0;
                //matching food list
                for (int j = 0; j < hob5.length; j++) {
                  try {
                    if (hob5[j] == f[i]['hobby5'][j]) {
                      counter += 1;
                      counter5 += 1;
                    }
                  } catch (e) {}
                }
                List<int> matches = [];
                matches.add(counter1);
                matches.add(counter2);
                matches.add(counter3);
                matches.add(counter4);
                matches.add(counter5);
                matches.sort();
                if (matches[4] == counter1) {
                  main_matches1 = "Reading";
                } else if (matches[4] == counter2) {
                  main_matches1 = "Watching";
                } else if (matches[4] == counter3) {
                  main_matches1 = "Sports";
                } else if (matches[4] == counter4) {
                  main_matches1 = "Gaming";
                } else if (matches[4] == counter5) {
                  main_matches1 = "Food";
                }
                if (matches[3] == counter1) {
                  main_matches2 = "Reading";
                } else if (matches[3] == counter2) {
                  main_matches2 = "Watching";
                } else if (matches[3] == counter3) {
                  main_matches2 = "Sports";
                } else if (matches[3] == counter4) {
                  main_matches2 = "Gaming";
                } else if (matches[3] == counter5) {
                  main_matches2 = "Food";
                }

                users.add(new UserMatch(
                    imageurl: f[i]['image'],
                    name: f[i]['name'],
                    gender: f[i]['gender'],
                    matchCount: counter,
                    firstName: f[i]['first_name'],
                    lastName: f[i]['last_name']));
              }
            }

            for (int i = 0; i < users.length; i++) {
              int m = i;
              for (int j = i + 1; j < users.length; j++) {
                if (users[i].matchCount < users[j].matchCount) {
                  m = j;
                }
              }
              var t = users[i];
              users[i] = users[m];
              users[m] = t;
            }
            users1 = users;
            void show() {
              print("c" + users.length.toString());
            }

            Card Carder(int index) {
              return Card(
                  color: Colors.orange,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Image.asset(users1[index].imageurl,
                            width: 180, height: 180),
                        Text(this.users1[index].name,
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Text(
                            this.users1[index].firstName.toString() +
                                " " +
                                this.users1[index].lastName.toString(),
                            style: TextStyle(fontSize: 30)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(this.users1[index].matchCount.toString(),
                            style: TextStyle(fontSize: 30)),
                        /*IconButton(
                          iconSize: 35,
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShowTemplates(this.users[index].name)));
                          },
                        )*/
                      ],
                    ),
                  ));
            }

            //print("length of the users is " + users[0].matchCount.toString());
            final controller = TextEditingController();
            controller.addListener(() {
              print("i am executing");

              if (controller.text.isEmpty) {
                this.users1 = users;
              } else {
                changeList(controller.text);
              }
            });
            String searchtext = "";
            bool showall = true;
            bool showsome = true;
            return Scaffold(
              backgroundColor: isblack ? Colors.black : Colors.white,
              appBar: AppBar(
                title: Text("HobbyMatcher"),
                backgroundColor: Colors.black,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.cake),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mail_outlined,
                      color: Colors.orange,
                    ),
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.logout),
                    onPressed: () {},
                    label: Text("logout"),
                  )
                ],
              ),
              body: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemCount: this.users1.length + 1,
                  itemBuilder: (context, index) {
                    return Carder(index);
                  }),
            );
          });
    }
  }
}
