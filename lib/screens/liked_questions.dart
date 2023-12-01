import 'package:flutter/material.dart';

class LikedQuestions extends StatefulWidget {
  const LikedQuestions({super.key});

  @override
  State<LikedQuestions> createState() => _LikedQuestionsState();
}

class _LikedQuestionsState extends State<LikedQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("You favorite questions here....."),
      ),
    );
  }
}
