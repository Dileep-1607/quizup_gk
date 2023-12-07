import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/c_text.dart';
import 'package:general_knowledge_gk/screens/quiz/quiz_categories.dart';
import 'package:general_knowledge_gk/screens/quiz_practice.dart';
import 'package:general_knowledge_gk/screens/random_gk/gk_home.dart';
import 'package:general_knowledge_gk/screens/sub_category.dart';
import 'package:get/get.dart';
import '../components/appDrawer.dart';
import '../components/appbar.dart';
import '../components/my_container.dart';
import '../config/remote_config.dart' as CONFIG;
import '../helpers/txt_format.dart';
import 'exams/exams_categories.dart';
import 'one_line_questions.dart';
import 'questions_sets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: MyAppBar(title: "QuizUp Gk Current Affairs Plus")),
      body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 20,),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 115,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(SubCategory(mainCategory:"current_affairs"));
                        },
                        child: MyContainer(
                          ml: 5,mr: 5, pt: 12, pb: 12,
                          h: 100, w: MediaQuery.of(context).size.width/2.4,
                          color: Colors.green.withAlpha(70),
                          child: Column(
                            children: [
                              Image.asset("assets/images/current_affairs.png", height: 60, width: 60,),
                              SizedBox(height: 8,),
                              Text("Current Affairs", style: TextStyle(
                                fontSize: 20,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 5,),
                    SizedBox(
                      height: 115,
                      child: GestureDetector(
                        onTap: (){
                           Get.to(ExamsCategories());
                        },
                        child: MyContainer(
                          ml: 5, pt: 12, pb: 12,
                          h: 100, w: MediaQuery.of(context).size.width/2.3,
                          color: Colors.green.withAlpha(70),
                          child: Column(
                            children: [
                              Image.asset("assets/images/exams.png", height: 60, width: 70,),
                              SizedBox(height: 8,),
                              Text("Exams", style: TextStyle(
                                fontSize: 20,
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// Quiz Container ///
                   SizedBox(height: 20,),
                Row(
                  children: [
                    MyContainer(
                      h: 120, w: MediaQuery.of(context).size.width/2.3,
                      mb: 15, pl: 10, pr: 10,pt:10, pb:10,
                      color: Colors.green.withAlpha(70),
                      child: GestureDetector(
                        onTap: ()=>Get.to(QuizCategories()),
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/random.png", height: 40, width: 40,),
                              SizedBox(
                                  width: 90,
                                  child: CText(text:txt("Random Quiz"), fontSize: 18, color: Colors.black54,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),

                    /// One line questions with answers ///
                    MyContainer(
                      h: 120, w: MediaQuery.of(context).size.width/2.3,
                      mb: 15, pl: 12, pr: 10,pt:10, pb:10,
                      color: Colors.green.withAlpha(70),
                      child: GestureDetector(
                        onTap: ()=>Get.to(QuestionsSets(setNumber: 'oneLineQuestionsSets',)),
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/random.png", height: 40, width: 40,),
                              SizedBox(
                                  width: 80,
                                  child: CText(text:txt("One line random Questions"), fontSize: 17, color: Colors.black54,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                /// Reading and gk Section ///
                Row(
                  children: [
                    MyContainer(
                      h: 120, w: MediaQuery.of(context).size.width/2.3,
                      mb: 15, pl: 10, pr: 10,pt:10, pb:10,
                      color: Colors.green.withAlpha(70),
                      child: GestureDetector(
                       // onTap: ()=>Get.to(QuizCategories()),
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/random.png", height: 40, width: 40,),
                              SizedBox(
                                  width: 90,
                                  child: CText(text:txt("Reading"), fontSize: 18, color: Colors.black54,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),

                    /// One line questions with answers ///
                    MyContainer(
                      h: 120, w: MediaQuery.of(context).size.width/2.3,
                      mb: 15, pl: 12, pr: 10,pt:10, pb:10,
                      color: Colors.green.withAlpha(70),
                      child: GestureDetector(
                        onTap: ()=>Get.to(GkHome()),
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/random.png", height: 40, width: 40,),
                              SizedBox(
                                  width: 80,
                                  child: CText(text:txt("Random GK"), fontSize: 17, color: Colors.black54,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                /// Single categories here///
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:CONFIG.singleCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 120,
                      crossAxisSpacing: 12.0,
                     // mainAxisSpacing: 12.0
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return MyContainer(
                      mb: 15, pl: 12, pr: 10, pt: 10, pb: 10,
                      color: Colors.green.withAlpha(70),
                      child: GestureDetector(
                        onTap: ()=>Get.to(QuizPractice(mainCategory:CONFIG.singleCategories[index], subCategory: '',), ),
                        child: Container(
                          padding: EdgeInsets.all( 10),
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/${CONFIG.singleCategories[index]}.png", height: 40, width: 40,),
                              SizedBox(
                                  width: 80,
                                  child: CText(text:txt(CONFIG.singleCategories[index]), fontSize: 18, color: Colors.black54,)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },),

                /// Multiple categories here///
                const SizedBox(height: 10,),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:CONFIG.multipleCategories.keys.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 120,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0
                  ),
                  itemBuilder: (BuildContext context, int index) {

                    return InkWell(
                      onTap: ()=>Get.to(SubCategory(mainCategory: CONFIG.multipleCategories.keys.elementAt(index))),
                      child: MyContainer(
                        pt: 15,
                        color: Colors.green.withAlpha(70),
                        child: Column(
                          children: [
                            Image.asset("assets/images/${CONFIG.multipleCategories.keys.elementAt(index)}.png", height: 60, width: 60,),
                            const SizedBox(height: 6,),
                            Text(txt(CONFIG.multipleCategories.keys.elementAt(index)),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },),
                SizedBox(height: 20,),
              ],
            ),
          )

      ),
    );
  }
}
