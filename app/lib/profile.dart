import 'package:app/authmodel.dart';
import 'package:app/donecollabs.dart';
import 'package:app/home.dart';
import 'package:app/recivedcollabs.dart';
import 'package:app/search.dart';
import 'package:app/secretkey.dart';
import 'package:app/sendcollabs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imgurl =
      "https://firebasestorage.googleapis.com/v0/b/project-e0ef7.appspot.com/o/images?alt=media&token=35c5f7d6-5688-4b95-bbfa-3ed1ddce7d00";
  var pick = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    AuthService auth = AuthService();
    Stream<DocumentSnapshot> snap =
        FirebaseFirestore.instance.collection('user').doc(user.uid).snapshots();

    return StreamBuilder<DocumentSnapshot>(
        stream: snap,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          print(snapshot.data['name']);

          var list = snapshot.data['dones'];
//function to upload profile picture
          bool isdefaultimg = true;

          print("in the profile page " + list.toString());
          String gender = snapshot.data['gender'];
          bool ismale = true;
          bool currentUser = false;
          if (snapshot.data['uid'] == user.uid) {
            currentUser = true;
          }
          if (gender != "Male") {
            ismale = false;
          }
          String url =
              "https://firebasestorage.googleapis.com/v0/b/project-e0ef7.appspot.com/o/2021-01-21%2016%3A08%3A47.911223?alt=media&token=6d209ff3-3bea-40a9-8cca-fd13c4a2b1ff";
          Future getimg() async {
            setState(() async {
              final ref =
                  FirebaseStorage.instance.ref().child(snapshot.data['image']);
              url = await ref.getDownloadURL();
              print("this is image " + url);
            });
          }

          if (snapshot.data['image'] != "default") {
            print("inside function");
            isdefaultimg = false;

            getimg();
          }
          void func() async {
            final storage = FirebaseStorage.instance;
            final picker = ImagePicker();
            PickedFile image;
            var unique_key = DateTime.now().toString();
            await Permission.photos.request();
            var perstatus = await Permission.photos.request();
            if (perstatus.isGranted) {
              image = await pick.getImage(source: ImageSource.gallery);
              var file = File(image.path);
              print(image.path);
              String urls = unique_key;
              if (image != null) {
                UploadTask snapshot =
                    storage.ref().child(unique_key).putFile(file);
                var url = await (await snapshot).ref.getDownloadURL();
                setState(() {
                  print(url);
                  setState(() {
                    imgurl = url;
                    FirebaseFirestore.instance
                        .collection('user')
                        .doc(user.uid)
                        .update({'image': unique_key});
                    isdefaultimg = false;
                    print(imgurl);
                    getimg();
                  });
                });
              }
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("Update Profile"),
              backgroundColor: Colors.deepPurpleAccent,
              actions: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                )
              ],
            ),
            body: Container(
              child: Column(
                children: [],
              ),
            ),
          );
        });
  }
}
