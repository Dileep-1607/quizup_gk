import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:general_knowledge_gk/global/session.dart' as SESSION;
import '../../components/c_text.dart';
import '../home.dart';

class ResultScreen extends StatefulWidget {
 // final String title;
  String passOrFail;
  String quizId;
  int points;
  final Map<int,dynamic> answer;
   final List listQuestion;

  ResultScreen({Key? key,required this.listQuestion, required this.answer, this.points = 0, required this.quizId, this.passOrFail =''}) : super(key: key);


  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int correct = 0 ;
  int incorrect = 0;
  int score = 0 ;
  final nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting();
    updateCoins();
  }

  updateCoins() async{
  try{
    var user = await FirebaseFirestore.instance.collection('users').doc(SESSION.uid);
    var _user = await user.get();
    num coins = _user['coins'];
    coins = coins + widget.points.floor();
    user.update({
      "coins":coins
    });
    SESSION.coins = coins;
    await FirebaseFirestore.instance.collection("users").doc(SESSION.uid).collection("unlocked_quiz").doc(widget.quizId).update(
        {"pass_or_fail" :"pass"}
    );
  }
  catch(e){
    print(e);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ballon2.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ballon4.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ballon2.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              right: -20,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/ballon4.png'),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child: Image.asset('assets/images/congratulation.png'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CText(
                        text:"Your Coins : ", fontSize: 24,
                      ),
                      CText(
                        text:"${widget.points}", fontSize: 24, color: Colors.red,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "You have successfully completed",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CText(text:"here title", fontSize: 18,),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Chip(

                          elevation: 5.0,
                          shadowColor: Colors.black54,
                          backgroundColor: Colors.grey[200],
                          label: Row(
                            children: <Widget>[
                              Icon(Icons.check,color: Colors.green,),
                              const SizedBox(
                                width: 10,
                              ),
                              widget.passOrFail=="pass"?
                              Text("${widget.points}  correct"):Text("${(widget.points/3).floor()}  correct"),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Chip(
                          elevation: 5.0,
                          shadowColor: Colors.black54,
                          backgroundColor: Colors.grey[200],
                          label: Row(
                            children: <Widget>[
                              Icon(Icons.close,color: Colors.red,),
                              const SizedBox(
                                width: 10,
                              ),
                              widget.passOrFail=="pass"? Text("${widget.listQuestion.length-widget.points} incorrect"):
                              Text("${widget.listQuestion.length-(widget.points/3).floor()} incorrect")
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // SizedBox(
                  //   width: 280,
                  //   child: ElevatedButton(
                  //     onPressed: (){
                  //       // Navigator.push(context, MaterialPageRoute(builder: (_)=>ShowQuestionScreen(
                  //       //   answer: widget.answer,
                  //       //   listQuestion: widget.listQuestion,))
                  //       // );
                  //     },
                  //     child: Text('Show answers'),
                  //   ),
                  // ),

                  SizedBox(
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.offAll(Home());
                        },
                        child: Text("Home"),

                      )
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}