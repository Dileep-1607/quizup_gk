
import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
 final double? h, w;
 final double borderW, borderR;
 final Color color;
 final Widget child;
 final double pl, pr, pt, pb, ml, mr, mt, mb;

   const MyContainer({super.key, this.h, this.w, this.borderW=0.3, this.borderR=12, required this.child,
     this.color=Colors.white,
   this.pl=0, this.pr=0, this.pt=0, this.pb=0, this.ml=0, this.mr=0, this.mt=0, this.mb=0
   });

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.pl, right:widget.pr, top:widget.pt, bottom:widget.pb),
      margin: EdgeInsets.only(left: widget.ml, right:widget.mr, top:widget.mt, bottom:widget.mb),
      height: widget.h,
      width: widget.w,
      decoration: BoxDecoration(
        color: widget.color,
       // border: Border.all(width: widget.borderW , color: Colors.blue),
        borderRadius: BorderRadius.all(Radius.circular(widget.borderR)),
        boxShadow:  [
          BoxShadow(
            blurRadius: 12.0,
            color:Colors.blue.withAlpha(60),
          ),
        ],
          gradient: const LinearGradient(
              colors: [
                Color(0xFF3366FF),
                Color(0xFF00CCFF),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),

      ),
      child: widget.child,
    );
  }
}
