import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:general_knowledge_gk/global/session.dart' as SESSION;

class CheckQuizUnlock{

  static Future<bool> checkQuizUnlockStatus(String quiz_doc_id) async{
    bool unlocked = false;
    await FirebaseFirestore.instance.collection("users").doc(SESSION.uid).collection("unlocked_quiz").doc(quiz_doc_id).get().then((value){
      unlocked = value.data().toString() != "null";
    });
    return unlocked;
  }
}