import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/my_text_field.dart';
import '../../models/question.dart';

class AddOneLineQuestion extends StatefulWidget {
  const AddOneLineQuestion({super.key});

  @override
  State<AddOneLineQuestion> createState() => _AddOneLineQuestionState();
}

class _AddOneLineQuestionState extends State<AddOneLineQuestion> {

  String collectionIndex = "1";
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Questions"),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$collectionIndex : "),
                SizedBox(height: 15,),
                Text("Enter Question"),
                SizedBox(height: 8,),
                MyTextField(
                  // height: 50,
                  width: 340,
                  controller:_questionController,
                ),
                SizedBox(height: 15,),

                Text("Enter Answer"),
                MyTextField(
                  // height: 50,
                  width: 340,
                  controller:_answerController,
                ),
                SizedBox(height: 15,),

                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      onPressed: (){
                       var _id =  FirebaseFirestore.instance.collection("one_line_questions").id;
                        try{
                          FirebaseFirestore.instance.collection("one_line_questions").doc(_id).collection(collectionIndex).add(
                              {
                                "question":_questionController.text.trim(),
                                "answer":_answerController.text.trim()
                              }
                          );
                        }
                        catch(e){
                          print(e);
                        }
                      },
                      child:Text("Submit") ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
