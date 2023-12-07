import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/question_card.dart';

class ExamQuizPractice extends StatefulWidget {
  String category;
  String setIndex;
   ExamQuizPractice({super.key, required this.category, required this.setIndex});

  @override
  State<ExamQuizPractice> createState() => _ExamQuizPracticeState();
}

class _ExamQuizPracticeState extends State<ExamQuizPractice> {
  @override
  Widget build(BuildContext context) {
    print(widget.category);
    print(widget.setIndex);
    return Scaffold(
      appBar: AppBar(title: Text("Exams", style: Theme.of(context).textTheme.titleMedium,),),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("exams")
            .doc(widget.category).collection(widget.setIndex).snapshots(),

        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            var questions = snapshot.data.docs;
            if(questions.length >0){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return QuestionCard(index: index, questions: questions[index],);
                },);
            }
            else{
              return Center(child: Container(child: Text("No Questions found!"),));
            }
          }
          else {
            return Container(child: Text(" error ${snapshot.hasError}"),);
          }

        },),
    );
  }
}
