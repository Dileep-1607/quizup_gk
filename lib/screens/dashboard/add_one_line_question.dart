import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/my_text_field.dart';


class AddOneLineQuestion extends StatefulWidget {
  const AddOneLineQuestion({super.key});

  @override
  State<AddOneLineQuestion> createState() => _AddOneLineQuestionState();
}

class _AddOneLineQuestionState extends State<AddOneLineQuestion> {

  bool isSubmit = false;
  String collectionIndex = "1";
  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();
  int totalQuestions = 0;


  @override
  void initState() {
    getLength();
    super.initState();
  }

   getLength() async {
    CollectionReference ref = FirebaseFirestore.instance.collection("one_line_questions")
        .doc("one_line_questions").collection(collectionIndex);
    AggregateQuerySnapshot result = await ref.count().get();
    setState(() {
      totalQuestions = result.count ;
    });
  }


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
                Text("Collection - $collectionIndex : Questions - $totalQuestions"),
                SizedBox(height: 15,),
                Text("Enter Question"),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _questionController,
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
                  maxLines: 4,
                  minLines: 2,
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
                        getLength();
                        if(totalQuestions<=50){
                          Get.snackbar("Alert", "50 Questions completed in this collection. Please increase Collection no", backgroundColor: Colors.white);
                        }
                        else if(_questionController.text !='' && _answerController.text !=''){
                         isSubmit = true;
                         var _id =  FirebaseFirestore.instance.collection("one_line_questions").id;
                         try{
                           FirebaseFirestore.instance.collection("one_line_questions").doc(_id).collection(collectionIndex).add(
                               {
                                 "question":_questionController.text.trim(),
                                 "answer":_answerController.text.trim()
                               }
                           );
                           Get.snackbar("Status", "Question Added");
                           _questionController.text ='';
                           _answerController.text ='';
                         }
                         catch(e){
                           print(e);
                         }
                         setState(() {

                         });
                       }
                       else{
                         print("Please enter both value");
                       }
                       isSubmit = false;
                      },
                      child:isSubmit ==false? Text("Submit"):CircularProgressIndicator() ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
