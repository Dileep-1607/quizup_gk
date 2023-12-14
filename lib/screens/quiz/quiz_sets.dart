import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/screens/quiz/quiz_intro.dart';
import 'package:get/get.dart';
import '../../components/start_quiz_card.dart';

class QuizSets extends StatefulWidget {
  String category;
   QuizSets({super.key, required this.category});

  @override
  State<QuizSets> createState() => _QuizSetsState();
}

class _QuizSetsState extends State<QuizSets> {
  @override
  Widget build(BuildContext context) {
    print(widget.category);
    return Scaffold(
      appBar: AppBar(title: Text("Quiz categories", style: Theme.of(context).textTheme.titleMedium,),),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
        child:StreamBuilder(
          stream: FirebaseFirestore.instance.collection("quiz").doc(widget.category).collection(widget.category).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

           if(snapshot.hasData){
             var quiz = snapshot.data.docs;
             return GridView.builder(
               shrinkWrap: true,
               itemCount:quiz.length,
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   mainAxisExtent: 100,
                   crossAxisSpacing: 12.0,
                   mainAxisSpacing: 12.0
               ),
               itemBuilder: (BuildContext context, int index) {
                 print(quiz[index]["description"]);
                 return InkWell(
                   onTap: (){
                     Get.to(QuizIntro(quiz: quiz[index],));
                   },
                   child: StartQuizCart(),
                 );
               },);
           }
           else{
             return Container();
           }
          },
        ),

      ),
    );
  }
}
