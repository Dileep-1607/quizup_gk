import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:general_knowledge_gk/screens/dashboard/dashboard_home.dart';
import 'package:general_knowledge_gk/screens/leaderboard.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:general_knowledge_gk/global/session.dart' as SESSION;
import '../screens/home.dart';
import '../screens/liked_questions.dart';
import 'c_text.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  _launchURL() async {
    final Uri url = Uri.parse('https://sites.google.com/view/generalknowlwdgegk/home');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left:5, top: 10),
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 10, color: Colors.lightBlueAccent),
              borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Image.asset("assets/images/profile.png"),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(SESSION.username,style:Theme.of(context).textTheme.titleSmall),
                        SizedBox(height: 3,),
                        CText(text: SESSION.email, fontSize: 12,),
                        SizedBox(height: 5,),
                        CText(text: "Coins: ${SESSION.coins}", fontSize: 15,),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10,),
               // CText(text: "Leaderboard - 230th Rank",)
              ],
            ),

          ),

          ListTile(
            leading: Icon(Icons.home, color: Colors.blueAccent,),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
            },
          ),

          // ListTile(
          //   leading: Icon(Icons.add),
          //   title: Text("Leaderboard"),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Leaderboard()));
          //   },
          // ),

          if(SESSION.email =='aaryan16072000@gmail.com')
          ListTile(
            leading: Icon(Icons.add,  color: Colors.blueAccent,),
            title: Text("Add Questions"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardHome()));
            },
          ),

          ListTile(
            leading: Icon(Icons.star,  color: Colors.blueAccent,),
            title: Text("My Questions"),
            onTap: () {
              Get.to(LikedQuestions());
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box,  color: Colors.blueAccent,),
            title: Text("About"),
            onTap: () {},
          ),

          ListTile(
            leading: Icon(Icons.logout, color: Colors.blueAccent,),
            title: Text("Logout"),
            onTap: () async{
              await FirebaseAuth.instance.signOut();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              leading: Icon(Icons.policy, color: Colors.blueAccent,),
              title: Text("Privacy Policy"),
              onTap: (){
                _launchURL();
              },
            ),
          )
        ],
      ),
    );
  }
}
