import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double targetValue = 100;

  @override
  void initState() {
    targetValue = targetValue == 100 ? 250 : 300;
    super.initState();
    Timer(const Duration(seconds: 5),
        () => Navigator.pushNamed(context, '/onboarding'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TweenAnimationBuilder(
          curve: Curves.bounceOut,
          tween: Tween<double>(begin: 110, end: targetValue),
          duration: const Duration(milliseconds: 500),
          builder: (BuildContext context, double size, Widget? child) {
            return Image.asset('images/zurilogo.png');
          },
        ),

       
      ),
    );
  }
}
