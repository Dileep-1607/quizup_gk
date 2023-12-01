
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/c_text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../components/my_container.dart';
import 'login.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController _emailController = TextEditingController();
  bool isSendLink = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 310,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 10, right: 15,top: 10),
              decoration: BoxDecoration(
                // border: Border.all(width: 5, color: Colors.white)
                  color: Colors.blue.shade300
              ),
              child: Lottie.asset('assets/lottie/animation_splash_2.json',),
            ),
          ),
          Positioned(
            top: 270,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)
                ),
                color: Colors.grey.shade200,
                gradient: const LinearGradient(
                    colors: [
                      Color(0xFFE6F7FC),
                      Color(0xFFFBF4FF),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(text: "QuizUp Gk Current Affairs Plus",fontSize: 17,fontWeight: FontWeight.w600, color: Colors.blue,),
                      SizedBox(height: 10,),
                      CText(text: "Forgot Your Password",fontSize: 23,fontWeight: FontWeight.w600, color: Colors.black54,),
                      SizedBox(height: 8,),
                      CText(text: "Please enter the email address you'd like your password reset information sent to",fontSize: 14,color: Colors.grey,),

                      SizedBox(height: 16,),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your Email",
                        ),
                      ),


                      SizedBox(height: 20,),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              if(_emailController.text != '')
                                isSendLink?null:resetLink();
                            },
                            child: MyContainer(
                              h: 40,
                              w: 150,
                              color: Colors.blue.withAlpha(100),
                              child: Center(child: isSendLink?CircularProgressIndicator():CText(text: "Request reset link",fontSize: 15,fontWeight: FontWeight.w500, color: Colors.white,)),
                            ),
                          )
                      ),

                      SizedBox(height: 20,),
                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              Get.offAll(Login());
                            },
                            child:CText(text: "<---  Back To Login",fontSize: 15,fontWeight: FontWeight.w500, color: Colors.blue,),
                          )
                      ),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

   resetLink() async{
    print("button clicked....");
    isSendLink = true;
   try{
     await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim()).then((value) {
       Get.snackbar("Alert", "We sent reset link. Please Your Email Box", colorText: Colors.green, backgroundColor: Colors.white,
         duration: const Duration(seconds: 3),
       );
     }).catchError((error){
       Get.snackbar("Error Alert", "${error}", colorText: Colors.red, backgroundColor: Colors.white,);
       isSendLink = false;
     });
   }
   on FirebaseAuthException catch(e){
     Get.snackbar("Error Alert", "${e}", colorText: Colors.red, backgroundColor: Colors.white,);
     isSendLink = false;
   }
   setState(() {
   });

  }

}
