import 'package:flutter/material.dart';

class AddQuizQuestions extends StatefulWidget {
  const AddQuizQuestions({super.key});

  @override
  State<AddQuizQuestions> createState() => _AddQuizQuestionsState();
}

class _AddQuizQuestionsState extends State<AddQuizQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Add Quiz"),
    );
  }
}
