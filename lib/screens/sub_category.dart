
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/screens/quiz_practice.dart';
import 'package:get/get.dart';
import '../components/c_text.dart';
import '../components/my_container.dart';
import '../config/remote_config.dart';
import '../helpers/txt_format.dart';


class SubCategory extends StatefulWidget {
  String mainCategory;
   SubCategory({super.key, required this.mainCategory,});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text(txt(widget.mainCategory), style: Theme.of(context).textTheme.titleMedium,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount:widget.mainCategory !="current_affairs"?multipleCategories[widget.mainCategory]?.length:currentAffairs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 100,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 12.0
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    if(widget.mainCategory =="current_affairs")
                      Get.to(QuizPractice(mainCategory:"current_affairs", subCategory:currentAffairs[index]));
                    Get.to(QuizPractice(mainCategory:widget.mainCategory, subCategory:multipleCategories[widget.mainCategory]![index]));

                    },
                  child: MyContainer(
                    pl: 12, pr: 10, pt: 10, pb: 10,
                    color: Colors.green.withAlpha(70),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width/2.6,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Center(child: CText(text:txt( widget.mainCategory !="current_affairs"?multipleCategories[widget.mainCategory]![index]:currentAffairs[index]), fontSize: 18, color: Colors.black54,)),
                    ),
                  ),
                );
              },),
          ),
        ),
      ),
    );
  }
}
