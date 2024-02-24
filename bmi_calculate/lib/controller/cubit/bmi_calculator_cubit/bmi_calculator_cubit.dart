// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../style/app_colors.dart';

part 'bmi_calculator_state.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState> {
  BmiCalculatorCubit() : super(BmiCalculatorInitial());

  static BmiCalculatorCubit get(context)=>BlocProvider.of(context);

  Color myColor = Colors.transparent;
  TextEditingController heightController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  var mainResult = TextEditingController();
  double yes = 1;


  calculateBMI(String height, String weight) {
    var doubleWeight = double.parse(weight);
    var doubleHeight = double.parse(height);
    var result = (doubleWeight/ (doubleHeight * doubleHeight));

      mainResult.text = result.toStringAsFixed(2);
      if (result < 18.5) {
        myColor = AppTheme.underweightColor;
        emit(UnderweightState());
      }
      else if (result >= 18.5 && result <= 24.9) {
        myColor = AppTheme.normalColor;
        emit(NormalState());
      }
      else if (result >= 25 && result <= 29.9) {
        myColor = AppTheme.overweightColor;
        emit(OverweightState());
      }
      else if (result >= 30 && result <= 34.9) {
        myColor = AppTheme.obeseColor;
        emit(ObeseState());
      }
      else if (result >= 35) {
        myColor = AppTheme.extremeColor;
        emit(ExtremeState());
      }
  }

}
