/// Execution starts here!

import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/results_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/' : (context) => MyHomePage(),
        '/results_page': (context)=> Result_page(),

      },
    );
  }
}


