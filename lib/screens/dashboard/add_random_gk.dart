import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/my_text_field.dart';

class AddRandomGk extends StatefulWidget {
  const AddRandomGk({super.key});

  @override
  State<AddRandomGk> createState() => _AddRandomGkState();
}

class _AddRandomGkState extends State<AddRandomGk> {

  bool isSubmit = false;
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
                        if(_questionController.text !='' && _answerController.text !=''){
                          isSubmit = true;
                          try{
                            FirebaseFirestore.instance.collection("random_gk").doc("national_park_in_india").collection("national_park_in_india").add(
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
