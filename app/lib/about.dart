import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "About Noice",
            style: TextStyle(color: Colors.yellow, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 58),
            child: Column(
              children: [
                Text(
                  "Developers",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/vedant.JPG',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        "Vedant Trivedi",
                        style: TextStyle(fontSize: 25, color: Colors.yellow),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(
                                  "https://wallpair.com/search/?user=vedant");
                            },
                            child: Image.asset(
                              'asset/mylogo.png',
                              width: 90,
                              height: 90,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launch(
                                  "https://www.instagram.com/vedanttrivedi1305/?hl=en");
                            },
                            child: Image.asset(
                              'asset/insta1.jpg',
                              width: 40,
                              height: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
