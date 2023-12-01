import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  String title;
   MyAppBar({super.key, required this.title});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 50, width: MediaQuery.of(context).size.width-10,
      margin: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
         border: Border.all(width: 0.4 , color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow:  [
          BoxShadow(
            blurRadius: 4.0,
            color:Colors.lightBlue.withAlpha(60),
          ),
        ],
      ),

      child: Row(
        children: [
          InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Icon(Icons.my_library_books,color: Theme.of(context).colorScheme.background  ,size: 30,)),
          SizedBox(width: 10,),
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium,)
        ],
      ),
    );
  }
}
