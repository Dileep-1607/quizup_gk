import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/c_text.dart';
import '../../components/my_text_field.dart';

class AddQuizQuestions extends StatefulWidget {
  const AddQuizQuestions({super.key});

  @override
  State<AddQuizQuestions> createState() => _AddQuizQuestionsState();
}

class _AddQuizQuestionsState extends State<AddQuizQuestions> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _questionController = TextEditingController();
  TextEditingController _optionsController = TextEditingController();
  TextEditingController _answerController = TextEditingController();

  List options=[];

  List<Map<String, dynamic>> questions =[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Quiz", style: Theme.of(context).textTheme.titleMedium,),),
      body: Column(
        children: [
         Row(
           children: [
            Column(
              children: [
                Text("Title"),
                MyTextField(
                  // height: 50,
                  width: MediaQuery.of(context).size.width/2.4,
                  controller:_titleController,
                ),
              ],
            ),
             SizedBox(width: 8,),
             Column(
               children: [
                 Text("description"),
                 MyTextField(
                   // height: 50,
                   width: MediaQuery.of(context).size.width/2,
                   controller:_descriptionController,
                 ),
               ],
             )
           ],
         ),
          Text(questions.length.toString()),
          SizedBox(height: 12,),
          Text("Enter Question"),
          MyTextField(
            // height: 50,
            width: 340,
            controller:_questionController,
          ),
          Text("Enter Options"),
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
          Text("Enter answer"),
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

                  else if(options.length !=4){
                    Get.dialog(
                      Dialog(child: CText(text: "Please enter option",),),
                    );
                  }
                  else if(_answerController.text ==''){
                    print("Please enter Answer");
                  }
                  else{
                    questions.add({
                      "question":_questionController.text.trim(),
                      "options":options,
                      "answer":_answerController.text.trim(),
                    });
                    _questionController.text ='';
                    _answerController.text ='';
                    options=[];
                    setState(() {

                    });
                  }
                },
                child:Text("Add Question") ),
          ),

          SizedBox(height: 100,),
          ElevatedButton(
              onPressed:(){
                if(_titleController.text ==''){
                  print("please enter quiz title");
                }
                else if(_descriptionController.text ==''){
                  print("Please enter Quiz descriotion");

                }
                else if(questions.length !=10){
                  print("please check questions, add 20 questions only");
                }
                else {
                  /// add to database
                  try{
                   FirebaseFirestore.instance.collection("quiz").doc("history").collection("history").add({
                     "title":_titleController.text.trim(),
                     "description":_descriptionController.text.trim(),
                     "questions":questions
                   }).then((docRef) {
                     FirebaseFirestore.instance.collection("quiz").doc("history").collection("history").doc(docRef.id).update({
                       "quizId":docRef.id,
                     });
                   });
                  }
                  catch(error){
                    print(error);
                  }

                }
              },
              child:Text("Add Quiz") ),

        ],
      ),
    );
  }

}

