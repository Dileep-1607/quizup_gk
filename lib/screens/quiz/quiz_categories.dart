import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/global/global.dart' as GLOBAL;
import 'package:general_knowledge_gk/screens/quiz/quiz_sets.dart';
import 'package:get/get.dart';
import '../../components/my_container.dart';
import '../../helpers/txt_format.dart';

class QuizCategories extends StatefulWidget {
  const QuizCategories({super.key});

  @override
  State<QuizCategories> createState() => _QuizCategoriesState();
}

class _QuizCategoriesState extends State<QuizCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Categories", style: Theme.of(context).textTheme.titleMedium,),),
      body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12,top: 15),
          child:GridView.builder(
            shrinkWrap: true,
            itemCount:GLOBAL.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 100,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0
            ),
            itemBuilder: (BuildContext context, int index) {

              return InkWell(
                onTap: (){
                  Get.to(QuizSets(category: GLOBAL.categories[index],));
                },
                child: MyContainer(
                   pl: 15,
                  color: Colors.green.withAlpha(80),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(txt(GLOBAL.categories[index],),
                      style: Theme.of(context).textTheme.titleMedium
                    ),
                  ),
                ),
              );
            },),

      ),
    );
  }
}

