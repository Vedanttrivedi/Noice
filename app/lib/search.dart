import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    String searchstr = "mostgood";
    Stream<QuerySnapshot> snap = FirebaseFirestore.instance
        .collection('user')
        .where('first_name', isEqualTo: searchstr)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          final controller = TextEditingController();
          print(snapshot.hasData);
          final list = snapshot.data.docs ?? [];
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: controller,
                      onChanged: (val) {
                        setState(() {
                          searchstr = val;
                          print(searchstr);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Search By Username",
                        enabledBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.orange, width: 2.0)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.orange, width: 2.0)),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.deepPurpleAccent,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
