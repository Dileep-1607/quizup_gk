
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:general_knowledge_gk/config/remote_config.dart' as CONFIG;

import '../components/my_container.dart';
import 'one_line_questions.dart';

class OneLineQuestionsSets extends StatelessWidget {

  const OneLineQuestionsSets({super.key,});

  @override
  Widget build(BuildContext context) {
    print(CONFIG.configKeys["oneLineQuestionsSets"]);
    return Scaffold(
      appBar: AppBar(title: Text("Random One Line Questions", style: Theme.of(context).textTheme.titleMedium,),),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20, top: 15),
        child:GridView.builder(
          shrinkWrap: true,
          itemCount:CONFIG.configKeys["oneLineQuestionsSets"],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 120,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0
          ),
          itemBuilder: (BuildContext context, int index) {

            return InkWell(
              onTap: (){
                Get.to(OneLineQuestions(questionsCollection:index+1));
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
