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
                        'asset/a1.png',
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
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/a5.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        "Tushar Chhugani",
                        style: TextStyle(fontSize: 22, color: Colors.yellow),
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
                                  "https://wallpair.com/search/?user=janidushman");
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
                                  "https://www.instagram.com/tusharchhugani/?hl=en");
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
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/a6.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        "Anurag Sharma",
                        style: TextStyle(fontSize: 22, color: Colors.yellow),
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
                                  "https://wallpair.com/search/?user=AdrashNOOBmaster69");
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
                                  "https://www.instagram.com/anuragsharma6100/?hl=en");
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
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/default.jpg',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        "Vinay Kumar Rai",
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
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
                              launch("https://wallpair.com/search/?user=vinay");
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
                                  "https://www.instagram.com/iamvokar/?hl=en");
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
                Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/a2.png',
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        "Adarsh Pawar",
                        style: TextStyle(fontSize: 22, color: Colors.yellow),
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
                                  "https://wallpair.com/search/?user=Adarsh%20Pawar");
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
                                  "https://www.instagram.com/adarsh.pawar.22102/?hl=en");
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
