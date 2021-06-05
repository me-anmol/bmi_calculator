import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({this.height,this.weight}){
    _bmi = weight / pow(height/100, 2);
  }

  final int height;
  final int weight;
  double _bmi;

  String getResultantBMI(){

    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi >=25){
      return 'Overweight';
    }else if(_bmi >18){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getImpressions(){
    if(_bmi >=25){
      return 'You have a higher the normal body weight. Try to exercise more.';
    }else if(_bmi >18){
      return 'Well done you have a perfect BMI, Maintain what you got.';
    }else{
      return 'You have a lower the normal body weight. Try to increase your apatite';
    }
  }

}