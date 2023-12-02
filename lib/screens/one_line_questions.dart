
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/one_line_question_card.dart';
import 'package:get/get.dart';

import '../components/c_text.dart';

class OneLineQuestions extends StatefulWidget {
  final questionsCollection;
   OneLineQuestions({super.key, required this.questionsCollection});

  @override
  State<OneLineQuestions> createState() => _OneLineQuestionsState();
}

class _OneLineQuestionsState extends State<OneLineQuestions> {

  var questions;
  late String collectionID;

  @override
  void initState() {
    collectionID = FirebaseFirestore.instance.collection("one_line_questions").id;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Random One Line Questions", style: Theme.of(context).textTheme.titleMedium,),),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("one_line_questions").doc(collectionID).collection(widget.questionsCollection.toString()).snapshots(),
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
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

