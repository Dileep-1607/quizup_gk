import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/one_line_question_card.dart';



class OneLineReadingQuestions extends StatefulWidget {
  String category;
   OneLineReadingQuestions({super.key, required this.category});

  @override
  State<OneLineReadingQuestions> createState() => _OneLineReadingQuestionsState();
}

class _OneLineReadingQuestionsState extends State<OneLineReadingQuestions> {

  var questions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("random_gk").doc(widget.category).collection(widget.category).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          try{
            questions = snapshot.data.docs;
          }
          catch(e){}
          if(snapshot.hasData){
            return ListView.builder(

              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 8),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(

                  ),
                  child: OneLineQuestionCard(questions: questions, index: index,),
                );
              },);
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },)
    );
  }
}
