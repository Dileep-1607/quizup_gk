import 'package:flutter/material.dart';

import '../helpers/txt_translate.dart';
import '../models/question.dart';
import 'my_container.dart';
import 'option_card.dart';

class QuestionCard extends StatefulWidget {
  int index;
  var questions;
   QuestionCard({super.key, required this.questions, required this.index,});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool convert=false;
  String convertedString='';

  convertValue() async{
    convertedString = await TxtTranslate(widget.questions["question"]);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      pl: 10,pr: 10,pt: 10, pb: 15,
      ml: 10,mr: 10,mt: 10,
      color: Colors.red.withAlpha(10),
      w: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left:10,right: 10, top: 8, bottom: 8),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width-95,
                      child: Text("Q ${widget.index+1}: ${convert?convertedString:widget.questions["question"]}".replaceAll("\n", " "), style: TextStyle(fontSize: 18, color: Colors.black54),)),
                  SizedBox(width: 5,),
                  InkWell(
                      onTap: (){
                        convert = !convert;
                        convertValue();
                      },
                      child: Icon(Icons.translate, color: Colors.blueAccent,)),
                ],
              )
          ),
          SizedBox(height: 10,),
          OptionCard(option: widget.questions["options"][0], answer: widget.questions["answer"], abcd: 'A',),
          SizedBox(height: 7),
          OptionCard(option: widget.questions["options"][1], answer: widget.questions["answer"], abcd: 'B',),
          SizedBox(height: 7),
          OptionCard(option: widget.questions["options"][2], answer: widget.questions["answer"], abcd: 'C',),

          SizedBox(height: 7,),
          OptionCard(option: widget.questions["options"][3]??'', answer: widget.questions["answer"], abcd: 'D',),
          SizedBox(height: 7,),
          //CText(text: questions[index]["explanation"]??"", color: Colors.black54,),
        ],
      ),
    );
  }
}
