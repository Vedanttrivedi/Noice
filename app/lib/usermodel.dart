import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData {
  String name;
  String gender;
  bool hobbyDone = false;
  UserData({this.name, this.gender});
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  //when the user login fetch his info like name,gender
  Future getUserInfo(User user) async {
    String uid = user.uid;
    await users.doc(uid).snapshots();
  }

  Future defaultData(String uid) async {
    print(users);
    try {
      print("method called");
      return await users
          .doc(uid)
          .set({'name': name, 'gender': gender, 'hobbyDone': hobbyDone});
    } catch (e) {
      print("got the error " + e);
      return null;
    }
    Future Done() async {
      hobbyDone = !hobbyDone;
      try {
        return await users
            .doc(uid)
            .set({'name': name, 'gender': gender, 'hobbyDone': hobbyDone});
      } catch (e) {
        print(e);
      }
    }
  }

  void func(DocumentSnapshot snap) {
    print("inside func");
    print(snap.data());
  }

  Stream<QuerySnapshot> get allusers {
    return users.snapshots();
  }

  Future getUser(String uid) async {
    print("getuserid");
    try {
      Stream<DocumentSnapshot> snap =
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
    } catch (e) {
      print(e);
    }
  }
  //UserData getCustomUser(DocumentSnapshot sna0)
}
