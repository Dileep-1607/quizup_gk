import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTheme{

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: AppBarTheme(
          color: Colors.lightBlue.withAlpha(100),
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.white
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
        titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black54),
        bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
        bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54),
        bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black54),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black54),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black54,
      fontFamily: "Muli",
      appBarTheme: AppBarTheme(
        systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Colors.white54) ,
          color: Colors.lightBlue.withAlpha(100),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.black)
      ),

      drawerTheme: DrawerThemeData(
          backgroundColor: Colors.black,

      ),

      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white60),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white60),
          titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white60),
          bodyLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white60),
          bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white60),
          bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.white60),

      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(

        labelStyle: TextStyle(color: Colors.black54),
        hintStyle: TextStyle(color: Colors.black54),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
