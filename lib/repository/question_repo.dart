
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/question.dart';

class  QuestionRepo {
  Future<bool> save(Question question) async {
    FirebaseFirestore.instance.collection("general_awareness").add(question.toMap());
    return true;
  }

  Future<bool> delete(questionId, mainCategory) async {
    FirebaseFirestore.instance.collection('').doc(questionId).delete().catchError((e){
      return false;
    });
    return true;
  }
}
