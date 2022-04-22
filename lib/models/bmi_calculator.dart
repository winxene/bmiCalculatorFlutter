//to use the pow function
import 'dart:math';

//Basically stores functions that do the operation
class BMICalculator{

  //the star of the show, the calculator itself
  static calculateBMI(double height, double weight){
    //cm to m
    double heightInM= height/100;
    return weight/ pow((heightInM), 2);
  }
  //to decide the classification based on the gender
  static getBMI(bool isMale,double bmiValue)=> 
    isMale?BMICalculator.getBMIMale(bmiValue):BMICalculator.getBMIFemale(bmiValue);
  
  //to decide the classification for female
  static getBMIFemale(double bmiValue){
   if(bmiValue<17){
      return 'Underweight';
    }
    else if(bmiValue>=17 && bmiValue<23){
      return 'Normal';
    }
    else if(bmiValue>=23 && bmiValue<27){
      return 'Overweight';
    }
    else if(bmiValue>=27){
      return 'Obese';
    }
  }
  //to decide the classification for male
  static getBMIMale(double bmiValue){
    if(bmiValue<18){
      return 'Underweight';
    }
    else if(bmiValue>=18 && bmiValue<25){
      return 'Normal';
    }
    else if(bmiValue>=25 && bmiValue<27){
      return 'Overweight';
    }
    else if(bmiValue>=27){
      return 'Obese';
    }
  }
}

