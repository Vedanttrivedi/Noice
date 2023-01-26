import 'package:app/userclass.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  String getuserid(User user) {
    print("getuserid is called");
    print(user.uid);
    return user.uid;
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  Stream<User> get user {
    return auth.authStateChanges();
  }

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User user = authResult.user;
    UserBase customuser = UserBase(name: user.displayName, gender: "Male");
    customuser.firstUser(user.uid, user.email);
    print(user.email);
    return user;
  }

  Future signOutGoogle() async {
    print('methid');
    await googleSignIn.signOut();
    auth.signOut();
  }

  Future<String> registerEmail(
      String name, String gender, String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      UserBase customuser = UserBase(name: name, gender: gender);
      customuser.firstUser(user.uid, user.email);
      print(user.uid.toString());
      return user.uid.toString();
    } catch (e) {
      print("got error");
      print(e);
      return null;
    }
  }

  //auth.signWithGoo
  Future loginAno() async {
    UserCredential result = await auth.signInAnonymously();
    User user = result.user;
    //auth.signInWithCredential(credential)
    print("in the auth" + user.uid);
    return user.uid.toString();
  }

  Future login(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      return user;
    } catch (e) {
      print("got error");
      print(e);
    }
  }

  Future logout() async {
    try {
      auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
