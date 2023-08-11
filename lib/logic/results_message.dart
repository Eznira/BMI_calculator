/// Concerned with generating comments based on BMI values

import 'package:bmi_calculator/logic/logic.dart';

enum BodyTypes {
  normal,
  underweight,
  overweight,
}

class ResultsMessage {
  Logic logic;

  ResultsMessage(this.logic);

  late double bmiValue = logic.BMI;
  late BodyTypes bodyType = _setBodyType();

  BodyTypes _setBodyType() {
    if (bmiValue >= 25) {
      return bodyType = BodyTypes.overweight;
    } else if (bmiValue > 18.5) {
      return bodyType = BodyTypes.normal;
    } else {
      return bodyType = BodyTypes.underweight;
    }
  }

  String displayText1() {
    switch (bodyType) {
      case BodyTypes.overweight:
        return 'OVERWEIGHT';

      case BodyTypes.underweight:
        return 'UNDERWEIGHT';

      default:
        return 'NORMAL';
    }
  }

  String displayText2() {
    switch (bodyType) {
      case BodyTypes.overweight:
        return 'You have too much weight, try to exercise and watch your diet!';

      case BodyTypes.underweight:
        return 'Try to eat more';

      default:
        return 'You have a normal body weight!';
    }
  }
}
