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
  String mainCategory,  subCategory;
   QuizTest({Key? key, required this.mainCategory, this.subCategory =''}) : super(key: key);

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
     _idd = FirebaseFirestore.instance.collection(widget.mainCategory).id;
    result = getQuestions();
    startTimer();
  }

  getQuestions() async{
    print("this is called only one type........");
   if(widget.subCategory !=''){
     print(widget.subCategory);
     CollectionReference ref = FirebaseFirestore.instance.collection(widget.mainCategory).doc(_idd).collection(widget.subCategory);
      var res = await ref.limit(20).get();
      return res;
   }
   else{
     CollectionReference ref = FirebaseFirestore.instance.collection(widget.mainCategory);
     var res  = await ref.limit(20).get();
    return res;
   }
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
            child:FutureBuilder(
              future: result,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                print(snapshot.data);
                if (snapshot.hasData) {
                  var questions = snapshot.data.docs;
                  if (isLoaded == false) {
                    questionsList.add(questions[currentQuestionIndex]);
                    optionsList = questions[currentQuestionIndex]["options"];
                    optionsList.shuffle();
                    isLoaded = true;
                  }

                  return SingleChildScrollView(
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
                                "Question ${currentQuestionIndex + 1} of ${questions.length}")),
                        const SizedBox(height: 20),
                        CText(
                            color: Colors.white,
                            fontSize: 20,
                            text: questions[currentQuestionIndex]['question']),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: optionsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var answer = "answer";

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (questions[currentQuestionIndex]["answer"] ==
                                      optionsList[index].toString()) {
                                    optionsColor[index] = Colors.green;
                                    points = points + 3;
                                    answers[index] = optionsList[index].toString();
                                  } else {
                                    optionsColor[index] = Colors.red;
                                    answers[index] = optionsList[index].toString();
                                  }

                                  if (currentQuestionIndex < questions.length - 1) {
                                    Future.delayed(const Duration(seconds: 1), () {
                                      gotoNextQuestion();
                                    });
                                  } else {
                                    timer!.cancel();
                                    Get.off(ResultScreen(listQuestion: questions, answer:answers, points: points));
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
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                }
            },)

          )),
    );
  }
}
