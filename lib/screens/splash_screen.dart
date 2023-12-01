import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../main.dart';
import 'auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
     Get.off(AuthGate());
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 140,),
          Container(
            padding: EdgeInsets.only(left: 10, right: 15),
            decoration: BoxDecoration(
               // border: Border.all(width: 5, color: Colors.white)
            ),
            child: Lottie.asset('assets/lottie/animation_splash_2.json',),
          ),
          Text("Welcome", style: TextStyle(
            fontSize: 30,
            color: Colors.black54
          ),),
          SizedBox(height: 8,),
          Text("General Knowledge GK", style: TextStyle(fontSize: 18, color: Colors.blue),),

        ],
      ),
    );
  }
}
