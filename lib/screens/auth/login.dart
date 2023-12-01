import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/components/c_text.dart';
import 'package:general_knowledge_gk/screens/auth/register.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../components/my_container.dart';
import 'forgot_password.dart';
import 'google_sign_in.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isSigning=false;
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
                  color: Theme.of(context).colorScheme.background,

                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CText(text:"QuizUp Gk Current affairs plus",fontSize: 23,fontWeight: FontWeight.w600, color: Colors.black,),
                        SizedBox(height: 6,),
                        CText(text: " Login to continue your account",fontSize: 15, color: Colors.blue,),
                        SizedBox(height: 16,),
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
                        Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: (){
                                  Get.to(ForgotPassword());
                                },
                                child: CText(text: "Forgot password",fontSize: 14, color: Colors.black54,))),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){
                              if(!isSigning)
                                 signIn();
                              print("clicked button");
                              setState(() {

                              });
                            },
                            child: MyContainer(
                              h: 40,
                              w: 130,
                              color: Colors.blue.withAlpha(100),
                              child: Center(child: isSigning?CircularProgressIndicator():CText(text: "Login",fontSize: 16,fontWeight: FontWeight.w600, color: Colors.white,)),
                            ),
                          )
                        ),

                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CText(text: "You havn't account? ",fontSize: 15, color: Colors.black,),
                            InkWell(
                                onTap: (){
                                  Get.to(Register());
                                },
                                child: CText(text: " Register",fontSize: 15, fontWeight: FontWeight.w600, color: Colors.blue,)),
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
    );
  }

  void signIn() async{
    isSigning = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );

    } on FirebaseAuthException catch (e) {
      isSigning=false;
      print(e.code);
      print(e);
      if (e.code == 'invalid-email') {
        Get.snackbar(
          "Alert",
          "Email badly formatted",
          colorText: Colors.red,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.error),
        );
        print("No user found for that email");
      }
      else if (e.code == 'invalid-login-credentials') {
        Get.snackbar(
          "Alert",
          "Wrong email or password",
          colorText: Colors.red,
          backgroundColor: Colors.lightBlue,
          icon: const Icon(Icons.error),
        );
        print("No user found for that email");
      }

    }
    setState(() {

    });
  }
}
