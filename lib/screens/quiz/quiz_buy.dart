import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/screens/quiz/quiz_test.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../components/start_quiz_card.dart';

class QuizBuy extends StatefulWidget {
  const QuizBuy({super.key});

  @override
  State<QuizBuy> createState() => _QuizBuyState();
}

class _QuizBuyState extends State<QuizBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child:  GestureDetector(
            onTap: (){
            },
            child: StartQuizCart(),
          ),
        )
    );
  }
}
