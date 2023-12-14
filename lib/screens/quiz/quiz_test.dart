import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/models/question.dart';
import 'package:general_knowledge_gk/screens/quiz/result_screen.dart';
import 'package:get/get.dart';

import '../../components/c_text.dart';


class QuizTest extends StatefulWidget {
  var questions;

   QuizTest({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuizTest> createState() => _QuizTestState();
}

class _QuizTestState extends State<QuizTest> {
  var currentQuestionIndex = 0;
  int seconds = 30;
  Timer? timer;
  late Future result;
  int points = 0;
  var isLoaded = false;
  var optionsList = [];
  List questionsList =[];

  Map<int, dynamic> answers ={};

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  var _idd;
  @override
  void initState() {
    super.initState();


    startTimer();
  }



  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  resetColors() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds:1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          gotoNextQuestion();
        }
      });
    });
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    resetColors();
    timer!.cancel();
    seconds = 30;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    optionsList = widget.questions[currentQuestionIndex]["options"];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 32, 67, 224), Color(0xff3442af)],
                )
            ),
            child:SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.lightBlueAccent, width: 2),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              CupertinoIcons.xmark,
                              color: Colors.white,
                              size: 28,
                            )),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CText(color: Colors.white, text: "$seconds"),
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(
                              value: seconds / 30,
                              valueColor:
                              const AlwaysStoppedAnimation(Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.lightBlueAccent, width: 2),
                        ),
                        child: TextButton.icon(
                            onPressed: null,
                            icon: const Icon(CupertinoIcons.heart_fill,
                                color: Colors.white, size: 18),
                            label: CText(
                                color: Colors.white, fontSize: 14, text: "Like")),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Image.asset("assets/images/question-and-answer.png", height: 220, width: 280,),
                  // Image.asset(ideas, width: 200),
                  const SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CText(
                          color: Colors.lightBlueAccent,fontSize: 18,
                          text:
                          "Question ${currentQuestionIndex + 1} of ${widget.questions.length}")),
                  const SizedBox(height: 20),
                  CText(
                      color: Colors.white,
                      fontSize: 20,
                      text: widget.questions[currentQuestionIndex]['question']),
                  const SizedBox(height: 20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: optionsList.length,
                    itemBuilder: (BuildContext context, int index) {

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.questions[currentQuestionIndex]["answer"] ==
                                optionsList[index].toString()) {
                              optionsColor[index] = Colors.green;
                              points = points + 3;
                              answers[index] = optionsList[index].toString();
                            } else {
                              optionsColor[index] = Colors.red;
                              answers[index] = optionsList[index].toString();
                            }

                            if (currentQuestionIndex < widget.questions.length - 1) {
                              Future.delayed(const Duration(seconds: 1), () {
                                gotoNextQuestion();
                              });
                            } else {
                              timer!.cancel();
                              Get.off(ResultScreen(listQuestion: widget.questions, answer:answers, points: points));
                              //here you can do whatever you want with the results
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          alignment: Alignment.center,
                          width: size.width - 100,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: optionsColor[index],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CText(
                            color: Colors.blue,
                            fontSize: 18,
                            text: optionsList[index].toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

          )),
    );
  }
}
