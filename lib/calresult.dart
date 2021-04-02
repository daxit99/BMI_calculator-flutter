
import 'dart:math';
import 'resultpage.dart';
import 'package:flutter/material.dart';

class CalculateResult{
  CalculateResult(this.height,this.weight);
   final int height;
   final int weight;
  double result;
  String msg='normal';


  stringcalculateresult(){
    result=weight/pow(height/100, 2);
    return result.toStringAsFixed(1);
  }

  String getdescription(){

    if(result>25){
      msg="overweight";
      return " you have higher weight then normal,try to lose your weight through any activity you want";
    }
    else if(result>18.5){
      msg='normal';
      return " For most adults, an ideal BMI is in the 18.5 to 24.9 range. For children and young people aged 2 to 18, the BMI calculation takes into account age and gender as well as height and weight. If your BMI is: below 18.5 – you're in the underweight range";
    }
    else if(result<18.5){
      msg='Underweight';
      return " Weight gain occurs when more energy (as calories from food and beverage consumption) is gained than the energy expended by life activities, including normal physiological processes and physical exercise";
    }
  }
}
