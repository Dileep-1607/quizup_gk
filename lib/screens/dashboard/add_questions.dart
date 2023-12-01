
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/c_text.dart';
import 'package:general_knowledge_gk/components/my_text_field.dart';
import 'package:general_knowledge_gk/models/question.dart';
import 'package:general_knowledge_gk/global/global.dart' as GLOBAL;
import 'package:get/get.dart';
import '../../repository/question_repo.dart';


class AddQuestions extends StatefulWidget {
  const AddQuestions({super.key});
  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}
class _AddQuestionsState extends State<AddQuestions> {

  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();
  TextEditingController _explanationController = TextEditingController();
  TextEditingController _optionsController = TextEditingController();
  TextEditingController _subCategoryController = TextEditingController();

  List options=[];

  String gkMainCategory = '';

  @override
  void initState() {
    // dataUpdate();
    //myFunction();
    super.initState();
  }


  myFunction() async{
    var _idd = FirebaseFirestore.instance.collection("sports").id;
      CollectionReference ref = FirebaseFirestore.instance.collection('sports').doc(_idd).collection("volleyball");
    AggregateQuerySnapshot result = await ref.count().get();
      print(result.count);
  }

    /// This function is use for data arrangement ///
    //  Future dataUpdate() async {
    //    var _idd = FirebaseFirestore.instance.collection("sports").id;
    //   CollectionReference ref = FirebaseFirestore.instance.collection('sports').doc(_idd).collection("");
    //   QuerySnapshot result = await ref.get();
    //
    //   var _id = FirebaseFirestore.instance.collection("current_affairs").id;
    //
    //    result.docs.forEach((element) {
    //      print(element["question"]);
    //      FirebaseFirestore.instance.collection("current_affairs").doc(_id).collection("").add({
    //        "question":element["question"],
    //        "options":element["options"],
    //        "answer":element["answer"]
    //      });
    //    });
    //   print("done... science");
    // }




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
                // SizedBox(height: 15,),
                // Text("Question Type"),
                // SizedBox(height: 8,),
                // Container(
                //   height: 50,
                //   child: DropdownButton(
                //       hint: Text("Please select a value"),
                //       value: gkMainCategory, // Initial value
                //       items: GLOBAL.all_category.keys.map<DropdownMenuItem<String>>((e) {
                //         return DropdownMenuItem(value: e, child: Text(e[0].toUpperCase() + e.substring(1)));
                //       }
                //       ).toList(),
                //       onChanged: (String? value) {
                //         setState(() {
                //           gkMainCategory = value!;
                //         });
                //       }
                //   ),
                // ),
                SizedBox(height: 15,),
                Text("Enter Question"),
                SizedBox(height: 8,),
                MyTextField(
                 // height: 50,
                  width: 340,
                  controller:_questionController,
                ),
                SizedBox(height: 15,),

                SizedBox(height: 8,),
                options.isNotEmpty?Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(options.toString()),
                    InkWell(
                        onTap: (){
                          setState(() {
                            options = [];
                          });
                        },
                        child: Text("Clear")),
                  ],
                ):Container(),
                SizedBox(height: 8,),
                Row(
                  children: [
                    MyTextField(
                      height: 50,
                      width: 200,
                      controller:_optionsController,
                    ),
                    SizedBox(width: 15,),
                    ElevatedButton(
                        onPressed: (){
                          if(_optionsController.text != '')
                          setState(() {
                            options.add(_optionsController.text.trim());
                            _optionsController.text = '';
                          });
                        },
                        child: Text("Add Option")
                    )
                  ],
                ),
                SizedBox(height: 15,),
                Text("Select Category"),
                MyTextField(
                  // height: 50,
                  width: 340,
                  controller:_subCategoryController,
                ),
                // DropdownButton(
                //     hint: Text("Please select a value"),
                //     value: selectedValue, // Initial value
                //     items: cl.map<DropdownMenuItem<String>>((e) {
                //       return DropdownMenuItem(value: e, child: Text(e[0].toUpperCase() + e.substring(1)));
                //     }
                //     ).toList(),
                //     onChanged: (String? value) {
                //
                //     }
                // ),
                SizedBox(height: 8,),
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
                      onPressed:(){
                       if(_questionController.text ==''){
                          Get.dialog(
                            Dialog(child: CText(text: "Please enter Question",),),
                          );
                          print("Please enter Questoin");
                        }
                        else if(_answerController ==''){
                          print("Please enter Answer");
                        }
                        else if(options.length !=4){
                          Get.dialog(
                            Dialog(child: CText(text: "Please enter option",),),
                          );
                        }
                        else{
                          QuestionRepo().save( Question(
                            question:_questionController.text.trim(),
                            options: options,
                            answer: _answerController.text.trim(),
                          )).then((value) => Navigator.pop(context));
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
