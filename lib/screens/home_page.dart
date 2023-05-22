///This is the first screen that contains ui for obtaining values to calculate BMI;
///
///Values needed for calculating BMI:
///i. weight
///ii. height
///iii. age
///
/// It is a stateful widget that manages states for weight, age and height in its ui
///






import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../logic/logic.dart';
import '../logic/results_message.dart';
import '../widgets/widgets.dart';


const int min_age = 1;
const int max_age = 120;
const double min_weight = 2.0;
const double max_weight = 300.0;
const double min_height = 10.0;
const double max_height = 300.0;




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double weight = 70;
  int age = 28;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  MyCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.male,
                          size: 100,
                        ),
                        Text(
                          'MALE',
                          style: ktext2,
                        ),
                      ],
                    ),
                  ),
                  MyCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.female,
                          size: 100,
                        ),
                        Text(
                          'FEMALE',
                          style: ktext2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            MyCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: ktext2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(height.toString(), style: ktext1),
                      const Text('cm'),
                    ],
                  ),
                  Slider(
                      min: min_height,
                      max: max_height,
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  MyCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: ktext2,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toStringAsFixed(0),
                                style: ktext1,
                              ),
                              const Text(
                                'kg',
                              )
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DecrementIcon(
                              ontap: () {
                                if (weight > min_weight && weight <= max_weight) {
                                  setState(() {
                                    weight--;
                                  });
                                }
                              },
                            ),
                            IncrementIcon(ontap: () {
                              if (weight >= min_weight && weight < max_weight) {
                                setState(() {
                                  weight++;
                                });
                              }
                            }),
                          ],
                        )
                      ],
                    ),
                  ),
                  MyCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: ktext2,
                        ),
                        Text(
                          age.toString(),
                          style: ktext1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DecrementIcon(
                              ontap: () {
                                if (age > min_age && age <= max_age) {
                                  setState(() {
                                    age--;
                                  });
                                }
                              },
                            ),
                            IncrementIcon(
                              ontap: () {
                                if (age >= min_age && age < max_age) {
                                  setState(() {
                                    age++;
                                  });
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            EndButton(
              displayText: 'CALCULATE',
              onTap: () {

                Navigator.pushNamed(context, '/results_page',
                    arguments: _dataToNextScreen());
              },
            ),
          ],
        ));
  }

  ResultsMessage _dataToNextScreen() {
     Logic logic = Logic(height: height, weight: weight, age: age);
    ResultsMessage resultsMessage = ResultsMessage(logic);
    return resultsMessage;
  }
}
