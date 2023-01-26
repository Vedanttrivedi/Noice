import 'package:cloud_firestore/cloud_firestore.dart';

class CollabClass {
  int id;
  String question1;
  String option1;
  String option2;
  String option3;
  String question2;

  String option4;
  String option5;
  String option6;
  String senderUid = "";
  String reciverUid = "";
  List<String> ansSender = [];
  List<String> ansReciver = [];
  bool senderDone = false;
  bool reciverDone = false;

  Future setCollab(
      String q1,
      String q2,
      String opt1,
      String opt2,
      String opt3,
      String opt4,
      String opt5,
      String opt6,
      String sid,
      String rid,
      String top,
      List<String> ansender) async {
    question1 = q1;
    question2 = q2;
    option1 = opt1;
    option2 = opt2;
    option3 = opt3;
    option4 = opt4;
    option5 = opt5;
    option6 = opt6;
    senderUid = sid;
    reciverUid = rid;
    var unique = DateTime.now().toString();
    print(unique);
    print("inside collab class");
    print("\n" + question1 + "\n");
    print(reciverUid);
    print(senderUid);
    print("customeuser");
    FirebaseFirestore.instance.collection('collab').doc(unique).set({
      'question1': question1,
      'question2': question2,
      'choice1': option1,
      'choice2': option2,
      'choice3': option3,
      'choice4': option4,
      'choice5': option5,
      'choice6': option6,
      'senderUid': senderUid,
      'recieverUid': reciverUid,
      'ansSender': ansender,
      'ansReciever': [],
      'score': 0,
      'topic': top,
      'senderDone': true,
      'recieverDone': false
    });

    FirebaseFirestore.instance.collection('user').doc(senderUid).update({
      'sender': FieldValue.arrayUnion([unique])
    });

    FirebaseFirestore.instance.collection('user').doc(reciverUid).update({
      'reciever': FieldValue.arrayUnion([unique]),
    });
  }
}
