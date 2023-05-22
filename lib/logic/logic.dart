/// This contain the logic for calculating the BMI

import 'dart:math';
import 'package:flutter/material.dart';



class Logic {
  Logic({required this.height, required this.weight, required this.age});

  int height;
  double weight;
  int age;

  late double BMI = _calculateBMI();

  double _calculateBMI() {
    return weight / pow(height/ 100, 2);
  }


}
