import 'package:flutter/material.dart';
import 'c_text.dart';


class OptionCard extends StatefulWidget {
  String option, answer, abcd;
  OptionCard({super.key, required this.option, required this.answer, required this.abcd});

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  Color color= Colors.white.withAlpha(100);
  Color textColor= Colors.black54;
  String answer='';

  @override
  void initState() {
    answer=widget.answer;
    super.initState();
  }

  @override
  void didUpdateWidget(OptionCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.answer != oldWidget.answer) {
      setState(() {
        answer = widget.answer;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(widget.option == widget.answer){
          color = Colors.green;
        }
        else{
          color = Colors.red.withAlpha(160);
        }
        setState(() {
          textColor = Colors.white;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: CText(text:"(${widget.abcd}) ${widget.option}", fontSize: 16,color:textColor,),
      ),
    );
  }
}
