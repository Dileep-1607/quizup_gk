import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/screens/quiz/quiz_intro.dart';
import 'package:get/get.dart';
import '../../components/start_quiz_card.dart';

class QuizSets extends StatefulWidget {
  const QuizSets({super.key});

  @override
  State<QuizSets> createState() => _QuizSetsState();
}

class _QuizSetsState extends State<QuizSets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz categories", style: Theme.of(context).textTheme.titleMedium,),),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
        child:GridView.builder(
          shrinkWrap: true,
          itemCount:7,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 100,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0
          ),
          itemBuilder: (BuildContext context, int index) {

            return InkWell(
              onTap: (){
                Get.to(QuizIntro(QuizAbout: 'About the quiz', QuizDuration: '10', QuizImgUrl: 'fahkfhd', QuizName: 'random', QuizTopics: 'quiz topic', QuizId:'', QuizPrice: '20',));
              },
              child: StartQuizCart(),
            );
          },),

      ),
    );
  }
}
