import 'package:cloud_firestore/cloud_firestore.dart';

class HobbyDatabase {
  String uid;
  String first_hobby;
  String second_hobby;
  HobbyDatabase({this.uid});

  CollectionReference hobby = FirebaseFirestore.instance.collection('hobby');
  void setHobby(String fh, String sh) {
    first_hobby = fh;
    second_hobby = sh;
  }

  Future firestore(String uid) async {
    print("setting hobby to firestore");
    try {
      return await hobby
          .doc(uid)
          .set({'first_hobby': first_hobby, 'second_hobby': second_hobby});
      print("noice");
    } catch (e) {
      print("error");
      print(e);
    }
  }
}
