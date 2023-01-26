import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class ImgPicker extends StatefulWidget {
  @override
  _ImgPickerState createState() => _ImgPickerState();
}

class _ImgPickerState extends State<ImgPicker> {
  String imgurl =
      "https://firebasestorage.googleapis.com/v0/b/project-e0ef7.appspot.com/o/images?alt=media&token=35c5f7d6-5688-4b95-bbfa-3ed1ddce7d00";
  var pick = ImagePicker();

  void func() async {
    final storage = FirebaseStorage.instance;
    final picker = ImagePicker();
    PickedFile image;

    await Permission.photos.request();
    var perstatus = await Permission.photos.request();
    if (perstatus.isGranted) {
      image = await pick.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      print(image.path);
      String urls = "images/" + image.path.toString();
      if (image != null) {
        UploadTask snapshot = storage.ref().child(urls).putFile(file);
        var url = await (await snapshot).ref.getDownloadURL();
        setState(() {
          print(url);
          imgurl = url;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home page"),
        ),
        body: Column(children: [
          RaisedButton(
            color: Colors.redAccent,
            padding: EdgeInsets.all(5),
            child: Text("Upload Image"),
            onPressed: func,
          ),
          Image.network(
            imgurl,
            width: 500,
            height: 400,
          )
        ]));
  }
}
