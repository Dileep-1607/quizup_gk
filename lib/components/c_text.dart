import 'package:flutter/material.dart';

class CText extends StatefulWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;
   CText({super.key , required this.text, this.fontSize = 14, this.color = Colors.grey, this.fontWeight = FontWeight.normal});

  @override
  State<CText> createState() => _CTextState();
}

class _CTextState extends State<CText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
     textAlign: TextAlign.center,
     style: TextStyle(
       fontSize: widget.fontSize,
       fontWeight: widget.fontWeight,
       color: widget.color,
     ),

      softWrap: true,
    );
  }
}
