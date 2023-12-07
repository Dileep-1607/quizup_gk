import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/question_card.dart';
import 'package:general_knowledge_gk/helpers/txt_format.dart';


class QuizPractice extends StatefulWidget {
  String mainCategory, subCategory;
   QuizPractice({super.key, required this.mainCategory, required this.subCategory});

  @override
  State<QuizPractice> createState() => _QuizPracticeState();
}

class _QuizPracticeState extends State<QuizPractice> {

late  Color color = Colors.grey.withAlpha(30);
 String _id ='';



  // Future<int> getLength() async {
  //   CollectionReference ref;
  // if(widget.subCategory !=''){
  //    ref = FirebaseFirestore.instance.collection(widget.mainCategory).doc(widget.subCategory).collection(widget.subCategory);
  // }
  // else{
  //    ref = FirebaseFirestore.instance.collection(widget.mainCategory);
  //  }
  //   AggregateQuerySnapshot result = await ref.count().get();
  //    return (result.count/10).floor();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(txt(widget.subCategory==''?widget.mainCategory:widget.subCategory), style: Theme.of(context).textTheme.titleMedium,),),
        body: StreamBuilder(
        stream: widget.subCategory!=""?FirebaseFirestore.instance.collection(widget.mainCategory)
            .doc(widget.subCategory).collection(widget.subCategory).snapshots()
            :FirebaseFirestore.instance.collection(widget.mainCategory).snapshots(),
           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
           var questions = snapshot.data.docs;
           if(questions.length >0){
             return ListView.builder(
               shrinkWrap: true,
               itemCount: questions.length,
               itemBuilder: (BuildContext context, int index) {
                 return QuestionCard(index: index, questions: questions[index],);
               },);
           }
           else{
            return Center(child: Container(child: Text("No Questions found!"),));
           }
          }
          else {
            return Container(child: Text(" error ${snapshot.hasError}"),);
          }

      },),
    );
  }
}
