import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/c_text.dart';
import 'package:general_knowledge_gk/screens/quiz_practice.dart';
import 'package:get/get.dart';

import '../components/my_container.dart';
import '../config/remote_config.dart' as CONFIG;

class ExamsCategories extends StatelessWidget {
  const ExamsCategories({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exams Preparation", style: Theme.of(context).textTheme.titleMedium,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: CONFIG.exams.length,
              itemBuilder: (BuildContext context, int index) {
                print(CONFIG.exams.keys.elementAt(index));
                return MyContainer(h: 100, w: MediaQuery.of(context).size.width,
                  mb: 15, pl: 14,
                  color: Colors.green.withAlpha(70),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(QuizPractice(mainCategory:"exams", subCategory:CONFIG.exams.keys.elementAt(index)));
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 80,
                          width: MediaQuery.of(context).size.width-60,
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //  Image.asset("assets/icons/${GLOBAL.all_category[widget.mainCategory]![index]}.png", height: 45, width: 45,),
                              SizedBox(height: 12,),
                              Text( CONFIG.exams[CONFIG.exams.keys.elementAt(index)][0], style: Theme.of(context).textTheme.titleMedium,),
                              SizedBox(height: 4,),
                              Text(CONFIG.exams[CONFIG.exams.keys.elementAt(index)][1], style: Theme.of(context).textTheme.bodyLarge,),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                    ],
                  ),
                );
              },),
          ),
        ),
      ),
    );
  }
}
