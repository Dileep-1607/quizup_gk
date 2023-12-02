import 'package:flutter/material.dart';

import 'c_text.dart';

class OneLineQuestionCard extends StatefulWidget {
 final questions;
 final int index;
   OneLineQuestionCard({super.key, required this.questions, this.index = 1});

  @override
  State<OneLineQuestionCard> createState() => _OneLineQuestionCardState();
}

class _OneLineQuestionCardState extends State<OneLineQuestionCard> {
  bool showAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CText(text:"Q${widget.index+1}:", fontSize: 16,),
            SizedBox(width: 8,),
            SizedBox(
              width: MediaQuery.of(context).size.width-65,
              child: Text("${widget.questions[widget.index]["question"]}".replaceAll("\n", " "), style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        if(showAnswer)
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 8),
            child: Text("Answer: ${widget.questions[widget.index]["answer"]}", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green
            ),
              textAlign: TextAlign.start,
            ),
          ),

        Padding(
          padding: const EdgeInsets.only(left: 25, top: 8),
          child: GestureDetector(
            onTap: (){
              setState(() {
                showAnswer = !showAnswer;
              });
            },
            child: Container(
              height: 40, width: 130,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Center(child: Text("Show Answer", style: Theme.of(context).textTheme.titleSmall,)),
            ),
          ),
        )
      ],
    );
  }
}
