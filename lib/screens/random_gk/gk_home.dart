import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/my_container.dart';
import 'package:general_knowledge_gk/helpers/txt_format.dart';
import 'package:general_knowledge_gk/config/remote_config.dart' as CONFIG;
import 'package:get/get.dart';

import 'one_line_reading_questions.dart';

class GkHome extends StatelessWidget {
  const GkHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Random GK", style: Theme.of(context).textTheme.titleMedium,),),
      body: GridView.builder(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        itemCount: CONFIG.OneLineReading.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 70,
          crossAxisSpacing: 12.0,
           mainAxisSpacing: 8.0
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Get.to(OneLineReadingQuestions(category:CONFIG.OneLineReading[index],));
            },
            child: MyContainer(
              pr: 10, pl: 15,
                color: Colors.green.withAlpha(70),
                child: Center(child: Text(txt(CONFIG.OneLineReading[index]),style: Theme.of(context).textTheme.titleMedium,),)
            ),
          );
      },

      ),
    );
  }
}
