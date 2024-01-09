import 'package:flutter/material.dart';

class Fail extends StatefulWidget {
  const Fail({super.key});

  @override
  State<Fail> createState() => _FailState();
}

class _FailState extends State<Fail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("You are fail!", style: Theme.of(context).textTheme.titleMedium,),),
      body: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Text("You are not pass in this quiz. Score must be more than 50%", style: Theme.of(context).textTheme.titleMedium,),
          ),
        ),
      ),
    );
  }
}
