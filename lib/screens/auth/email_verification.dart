import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../components/c_text.dart';
import '../../components/my_container.dart';
import '../home.dart';
import 'login.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {

  bool isEmailVerified = false;
  bool isSend = false;
  Timer? timer;

  @override
  void initState() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if(!isEmailVerified){
     timer = Timer.periodic(
        Duration(seconds: 3),
        (_)=> checkEmailVerified(),
      );
    }
    super.initState();
  }

  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      if(isEmailVerified){
        timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
   timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return isEmailVerified?Home():Scaffold(
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
                      CText(text: "Verify your email address",fontSize: 23,fontWeight: FontWeight.w600, color: Colors.black54,),
                      SizedBox(height: 8,),
                      CText(text: "Please confirm that you want to use this as your QuizUp account email address. Once it's done you will be able to start App",fontSize: 14,color: Colors.grey,),

                      SizedBox(height: 20,),

                      Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              if(!isEmailVerified)
                                sendVerificationEmail();
                            },
                            child: MyContainer(
                              h: 40,
                              w: 200,
                              color: Colors.blue.withAlpha(100),
                              child: Center(child: isSend?CircularProgressIndicator():CText(text: "Send verification email",fontSize: 15,fontWeight: FontWeight.w500, color: Colors.white,)),
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

  Future sendVerificationEmail() async{
    isSend = true;
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      Get.snackbar(
        "Alert",
        "Please check your email",
      );
    }
    catch(e){
      Get.snackbar(
        "Alert",
        "Error: $e",
      );
      isSend = false;
    }
    setState(() {

    });
  }


}
