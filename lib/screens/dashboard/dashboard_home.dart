
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/screens/dashboard/add_current_affairs.dart';
import 'package:general_knowledge_gk/screens/dashboard/add_questions.dart';
import 'package:general_knowledge_gk/global/global.dart' as GLOBAL;
import '../../components/c_text.dart';
import '../../components/my_text_field.dart';
import '../../config/remote_config.dart';
import 'add_one_line_question.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {

  TextEditingController _subCategoryController = TextEditingController();
  String gkMainCategory = 'Select Main Category';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      body: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddQuestions()));
            },
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(30),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(child: Text("Add Questions", style: Theme.of(context).textTheme.titleMedium,)),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddCurrentAffairs()));
            },
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(30),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(child: Text("Add Current Affairs", style: Theme.of(context).textTheme.titleMedium,)),
            ),
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddOneLineQuestion()));
            },
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(30),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(child: Text("Add one line question", style: Theme.of(context).textTheme.titleMedium,)),
            ),
          ),

        ],
      ),
    );
  }



}
