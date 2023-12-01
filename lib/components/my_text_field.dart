import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  double? height, width;
  TextEditingController controller;
   MyTextField({super.key,required this.controller, this.height, this.width,});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        cursorColor: Colors.black45,
        style: TextStyle(
            color: Colors.black54
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.withAlpha(20),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
