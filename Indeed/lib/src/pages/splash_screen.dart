import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState(){

    var timer = Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
      });
    });

    Timer(
        const Duration(milliseconds: 10),(){
      setState(() {
        _isVisible = true;
      });
    }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
            opacity: _isVisible ? 1.0 : 0,
            duration: const Duration(milliseconds: 1200),
            child: Image.asset('assets/images/SampleLogo.png',)),
      ),
    );
  }
}
