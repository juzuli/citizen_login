import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'pages/login_page.dart';

class MyApp extends StatelessWidget {

  Color _primaryColor = HexColor('#DC54FE');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lgoin UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.blueAccent, colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      home: LoginPage(),
    );
  }
}