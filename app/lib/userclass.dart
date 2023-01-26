import 'package:cloud_firestore/cloud_firestore.dart';

class UserBase {
  String name;
  String gender;
  String hob1;
  String hob2;
  List<String> hobby1;
  List<String> hobby2;
  List<String> hobby3;
  bool hobbyDone = false;
  UserBase({this.name, this.gender});
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  Future firstUser(String uid, String email) async {
    print("setting up new user");
    try {
      await user.doc(uid).set({
        'uid': uid,
        'email': email,
        'name': name,
        'gender': gender,
        'hobby1': [],
        'hobby2': [],
        'hobby3': [],
        'hobby4': [],
        'dones': [],
        'hobbyDone': false,
        'isnamegiven': false,
        'first_name': "",
        'last_name': "",
        'image': 'default'
      });
    } catch (e) {
      print("got error");
      print(e);
    }
  }

  Future setUser(String uid, List h1, List h2, List hob3, List hob4, List hob5,
      String favs) async {
    try {
      print("setting up hobby");
      await user.doc(uid).update({
        'hobbyDone': true,
        'hobby1': h1,
        'hobby2': h2,
        'hobby3': hob3,
        'hobby4': hob4,
        'hobby5': hob5,
        'favs': favs
      });
    } catch (e) {
      print("got error");
      print(e);
    }
  }
}
