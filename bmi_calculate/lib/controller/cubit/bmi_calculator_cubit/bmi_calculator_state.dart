part of 'bmi_calculator_cubit.dart';

@immutable
abstract class BmiCalculatorState {}

class BmiCalculatorInitial extends BmiCalculatorState {}

class UnderweightState extends BmiCalculatorState {}

class NormalState extends BmiCalculatorState {}

class OverweightState extends BmiCalculatorState {}

class ObeseState extends BmiCalculatorState {}

class ExtremeState extends BmiCalculatorState {}
