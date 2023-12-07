
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:general_knowledge_gk/config/remote_config.dart' as CONFIG;

import '../../components/my_container.dart';
import 'exam_quiz_practice.dart';


class CategorySets extends StatefulWidget {
  String category;

  CategorySets({super.key, required this.category});

  @override
  State<CategorySets> createState() => _CategorySetsState();
}

class _CategorySetsState extends State<CategorySets> {
  @override
  Widget build(BuildContext context) {
    print(CONFIG.configKeys[widget.category]);
    return Scaffold(
      appBar: AppBar(title: Text("${widget.category} Sets", style: Theme.of(context).textTheme.titleMedium,),),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
        child:GridView.builder(
          shrinkWrap: true,
          itemCount:CONFIG.configKeys[widget.category],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 120,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0
          ),
          itemBuilder: (BuildContext context, int index) {

            return InkWell(
              onTap: (){
                Get.to(ExamQuizPractice(category:widget.category, setIndex: (index+1).toString(),));
              },
              child: MyContainer(
                pt: 15,
                color: Colors.green.withAlpha(70),
                child: Column(
                  children: [
                    Text("Set-${index+1}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text("50", style: Theme.of(context).textTheme.titleMedium,),
                    Text("Questions", style: Theme.of(context).textTheme.titleMedium,)
                  ],
                ),
              ),
            );
          },),

      ),
    );
  }
}
