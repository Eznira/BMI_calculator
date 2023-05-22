/// This is the screen for displaying results for BMI(gotten from the home_page
/// in form of the ResultsMessage object);
/// which includes BMI value and some comments. hence it is stateless.

import 'package:bmi_calculator/screens/home_page.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../logic/results_message.dart';
import '../widgets/widgets.dart';

class Result_page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final ResultsMessage resultsMessage = ModalRoute.of(context)!.settings.arguments as ResultsMessage;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Results',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50, color: Color(0xFF8D8E98)),
                ),
              ),
              MyCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(resultsMessage.displayText1(), style: TextStyle(fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),),
                    Text(resultsMessage.bmiValue.toStringAsFixed(1), style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900),),
                    Text(resultsMessage.displayText2(), textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              EndButton(displayText: 'RE-CALCULATE',onTap: (){
                Navigator.pop(context);
              },)

            ],
          ),
        ),
      ),
    );
  }
}
