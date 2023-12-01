import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/c_text.dart';
import 'package:general_knowledge_gk/screens/auth/email_verification.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../components/my_container.dart';
import 'login.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();

  bool isRegister= false;
  bool _isObscured = true;
  Color _eyeButtonColor = Colors.black54;
  void _toggle() {
    setState(() {
      _isObscured = !_isObscured;
      _eyeButtonColor = _isObscured ? Colors.black54 : Colors.blue;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
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
                    color: Theme.of(context).colorScheme.background,

                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CText(text: "QuizUp Gk Current affairs plus",fontSize: 23,fontWeight: FontWeight.w600, color: Colors.black,),
                          SizedBox(height: 6,),
                          CText(text: " Create your account",fontSize: 15, color: Colors.blue,),
                          SizedBox(height: 16,),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: "Name",
                              hintText: "Enter your Name",
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your Email",
                            ),

                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Enter your password",
                              suffixIcon: IconButton(
                                onPressed: _toggle,
                                color: _eyeButtonColor,
                                icon: _isObscured
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                            ),
                            obscureText: _isObscured,
                          ),
                          SizedBox(height: 10,),
                          TextFormField(
                            controller: _cPasswordController,
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              hintText: "Re-enter password",
                              suffixIcon: IconButton(
                                onPressed: _toggle,
                                icon: Container(),
                              )
                            ),
                            obscureText: _isObscured,
                          ),

                          SizedBox(height: 30,),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: (){
                                  if(_nameController.text.trim()==''){
                                    Get.snackbar(
                                      "Alert",
                                      "Please provide name",
                                      colorText: Colors.red,
                                      backgroundColor: Colors.lightBlue,
                                      icon: const Icon(Icons.error_outline_rounded),
                                    );
                                  }else if(_emailController.text.trim() ==''){
                                    Get.snackbar(
                                      "Alert",
                                      "Please Enter Email",
                                      colorText: Colors.red,
                                      backgroundColor: Colors.lightBlue,
                                      icon: const Icon(Icons.error_outline_rounded),
                                    );
                                  }
                                  else if(_passwordController.text.trim() !=_cPasswordController.text.trim()){
                                    Get.snackbar(
                                      "Alert",
                                      "Password Not matched",
                                      colorText: Colors.red,
                                      backgroundColor: Colors.lightBlue,
                                      icon: const Icon(Icons.error_outline_rounded),
                                    );
                                  }

                                  else if(_passwordController.text.trim() =='' && _cPasswordController.text.trim() ==""){
                                    Get.snackbar(
                                      "Alert",
                                      "Password not empty.",
                                      colorText: Colors.red,
                                      backgroundColor: Colors.lightBlue,
                                      icon: const Icon(Icons.error),
                                    );
                                  }
                                  else{
                                    register();
                                  }
                                },
                                child: MyContainer(
                                  h: 40,
                                  w: 130,
                                  color: Colors.blue.withAlpha(100),
                                  child: Center(child: isRegister?CircularProgressIndicator():CText(text: "Register",fontSize: 16,fontWeight: FontWeight.w600, color: Colors.white,)),
                                ),
                              )
                          ),
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CText(text: "Already have an account? ",fontSize: 15, color: Colors.black,),
                              InkWell(
                                  onTap: (){
                                    Get.off(Login());
                                  },
                                  child: CText(text: "Login",fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue,)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void register() async{
    isRegister = true;
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      print(credential);

      try{
        String _uid = FirebaseAuth.instance.currentUser!.uid;
        print(_uid);
        FirebaseFirestore.instance.collection("users").doc(_uid).set({
          "uid":_uid,
          "username":_nameController.text.trim(),
          "email":_emailController.text.trim(),
          "money":100,
        });
      }
      catch(e){
        Get.snackbar(
            "Alert", "User not added , Error: $e",
          colorText: Colors.red,
          backgroundColor: Colors.lightBlue,
        );
      }
      Get.to(EmailVerification());
    } on FirebaseAuthException catch (e) {
      isRegister = false;
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Alert",
          "The password provided is too weak.",
          colorText: Colors.red,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.mail_outline),
        );
      }
      else if (e.code == 'invalid-email') {
        Get.snackbar(
          "Alert",
          "The email address is badly formatted.",
          colorText: Colors.red,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.error),
        );
      }
      else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Alert",
          "The account already exists for that email.",
          colorText: Colors.red,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.mail_outline),
        );
      }
      Get.snackbar(
        "Alert",
        "Error: ${e.code}",
        colorText: Colors.red,
        backgroundColor: Colors.lightBlue,
        icon: const Icon(Icons.mail_outline),
      );
    }
    setState(() {

    });
  }
}
