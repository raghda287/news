import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLight=const Color(0xff39A552);
  static final ThemeData lightTheme=ThemeData(
    primaryColor: primaryLight,
    textTheme: TextTheme(
      headline6:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
      headline5: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)
    ),
  );


}