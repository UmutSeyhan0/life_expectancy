import 'package:life_expectancy/user_data.dart';

class Calculate {
  UserData _userData;

  Calculate(this._userData);

  int calculate() {
    double baseLifeExpectancy;

    if (_userData.selectedGender == 'MAN') {
      baseLifeExpectancy = 75.0;
    } else {
      baseLifeExpectancy = 80.0;
    }

    double exerciseFactor = _userData.sport! * 0.5;

    double smokingFactor = _userData.smokedCigarette! * -0.2;

    double bmi = _userData.weight! / (_userData.height! * _userData.height!);
    double bmiFactor;
    if (bmi < 18.5) {
      bmiFactor = -5.0;
    } else if (bmi >= 18.5 && bmi < 25) {
      bmiFactor = 0.0;
    } else {
      bmiFactor = -5.0;
    }

    double lifeExpectancy =
        baseLifeExpectancy + exerciseFactor + smokingFactor + bmiFactor;
    return lifeExpectancy.toInt();
  }
}
