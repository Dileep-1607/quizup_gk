import 'package:flutter/material.dart';

class ShowAnswer extends StatefulWidget {
  const ShowAnswer({super.key});

  @override
  State<ShowAnswer> createState() => _ShowAnswerState();
}

class _ShowAnswerState extends State<ShowAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         ListView.builder(
           shrinkWrap: true,

           itemBuilder: (BuildContext context, int index) {
           return Container();
         },)
        ],

      ),
    );
  }
}
