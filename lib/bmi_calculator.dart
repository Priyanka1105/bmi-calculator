class BMICalculator {
  final num height;
  final num weight;
  num _bmi = 0;

  BMICalculator({this.height = 0, this.weight = 0});

  String calculateBMI() {
    if (null != height && null != weight) {
      _bmi = (height / weight);
    }
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18) {
      return 'Normal';
    } else
      return 'Overwieght';
  }
}
