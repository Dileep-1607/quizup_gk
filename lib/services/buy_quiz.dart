import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:general_knowledge_gk/global/session.dart' as SESSION;
class BuyQuiz{
  static  Future<bool> buyQuiz({required int QuizPrice ,required String QuizID}) async{

    if(QuizPrice <= SESSION.coins){
     try{
       await FirebaseFirestore.instance.collection("users").doc(SESSION.uid).collection("unlocked_quiz").doc(QuizID).set(
           {
             "unlcoked_at" : DateTime.now(),
             "pass_or_fail":""

           }
       );
      SESSION.coins = SESSION.coins - QuizPrice;
     }
     catch(error){
       print("Error: $error");
     }
      ///DO YOUR TASK HERE
      print("QUIZ IS UNLOCKED NOW");
      return true;
    }else{
      print("PAISA KAMA KE AAO PEHLE");
      return false;
    }
  }
}