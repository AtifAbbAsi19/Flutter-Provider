




import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginScreen.dart';
import '../../navigation/Routes.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

   //var route = NavigationRoutes();


  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //throw UnimplementedError();

    return Scaffold(
      body: Container(
        child: Center(
            child: Text("Welcome to Splash Screen")
        ),
      ),
    );


  }
}