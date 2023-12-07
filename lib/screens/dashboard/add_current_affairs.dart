
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/c_text.dart';
import 'package:general_knowledge_gk/components/my_text_field.dart';
import 'package:general_knowledge_gk/models/question.dart';
import 'package:get/get.dart';


class AddCurrentAffairs extends StatefulWidget {
  const AddCurrentAffairs({super.key});
  @override
  State<AddCurrentAffairs> createState() => _AddCurrentAffairsState();
}
class _AddCurrentAffairsState extends State<AddCurrentAffairs> {

  TextEditingController _questionController = TextEditingController();
  TextEditingController _answerController = TextEditingController();
  TextEditingController _optionsController = TextEditingController();

  List options=[];

  int totalQuestions = 0;
  String collectionIndex = "6";


  @override
  void initState() {
    getLength();
    super.initState();
  }

  getLength() async {
    CollectionReference ref = FirebaseFirestore.instance.collection("exams")
        .doc("ssc").collection(collectionIndex);
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
                         try{
                           FirebaseFirestore.instance.collection("exams").doc("ssc").collection(collectionIndex).add(
                               Question(
                                 question:_questionController.text.trim(),
                                 options: options,
                                 answer: _answerController.text.trim(),
                               ).toMap()
                           );
                           Get.snackbar("Status", "Question Added");
                           setState(() {
                             _questionController.text ="";
                             _answerController.text = "";
                             options =[];
                           });
                         }
                         catch(e){
                           print(e);
                         }
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
