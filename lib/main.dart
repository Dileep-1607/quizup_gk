import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/theme/my_theme.dart';
import 'package:general_knowledge_gk/screens/auth/email_verification.dart';
import 'package:general_knowledge_gk/screens/auth/login.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'global/session.dart' as SESSION;
import 'package:general_knowledge_gk/screens/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'config/remote_config.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );

  remoteConfig();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key}); 

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(child: Center(child: CircularProgressIndicator(),),);
            } else {
              // user not signed in
              if (snapshot.data == null) {
                return Login();
              }
              else {
                //Render Your applicatiom if authenticated
                //and local session
                return FutureBuilder<bool>(
                  future: setSession( FirebaseAuth.instance.currentUser!.uid), // async work
                  builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Container(child: Center(child: CircularProgressIndicator(),),);
                      default:
                        if (snapshot.hasError) {
                          print("ERROR");
                          return Center(child: Text('Error: ${snapshot.error}'));
                          //return UserProfileForm();
                        } else {
                          return EmailVerification();
                        }
                    }
                  },
                );
              }
            }

          },)
    );
  }

  Future<bool> setSession(String uid) async {
   // print(uid);
    var result = await FirebaseFirestore.instance.collection("users").doc(uid).get();

    print("THis is user detail");
    SESSION.username = result['username'];
    SESSION.uid = result['uid']; 
    SESSION.email = result['email'];
    SESSION.coins = result['coins'];
    return true;
  }
}

