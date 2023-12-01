import 'package:flutter/material.dart';

import 'c_text.dart';

class StartQuizCart extends StatelessWidget {
  const StartQuizCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, top: 4,),
      height: 100,
      width: MediaQuery.of(context).size.width/3.5,
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow:  [
          BoxShadow(
            blurRadius: 10.0,
            color:Colors.blue.withAlpha(40),
          ),
        ],
      ),
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: CText(text: "Time: 10 M",fontSize: 10, color: Colors.grey.withAlpha(200),),
          ),
          SizedBox(height: 6,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CText(text: 'Start Quiz', fontSize: 16, color: Colors.black54,),
              Container(height: 1, color: Colors.lightBlue, margin: EdgeInsets.only(right: 18, top: 2,),),
              CText(text: "Questions: 20 ",fontSize: 12,)
            ],),

        ],
      ),
    );
  }
}
