import 'dart:async';

import 'package:flutter/material.dart';

import '../home/home_screen.dart';


class SplashScreen extends StatelessWidget {
static const String routeName='splash';
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    },);
    return Stack(
      children: [
        Container(

          color: Colors.white,
          child: Image.asset('assets/images/background.png',fit: BoxFit.fill,),
          width: double.infinity,
          height: double.infinity,

        ),
        Center(
          child: Container(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ],

    );

  }
}
