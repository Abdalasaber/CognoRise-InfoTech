import 'package:calculate_bmi/style/app_colors.dart';
import 'package:flutter/material.dart';

class ColorsCatalogModel {
  final Color colors;
  final String text;

  const ColorsCatalogModel({
    required this.colors,
    required this.text,
  });
}

List<ColorsCatalogModel> itemColorsCatalogModel = [
  const ColorsCatalogModel(
      colors: AppTheme.underweightColor, text: 'Underweight'),
  const ColorsCatalogModel(colors: AppTheme.normalColor, text: 'Normal'),
  const ColorsCatalogModel(
      colors: AppTheme.overweightColor, text: 'Overweight'),
  const ColorsCatalogModel(colors: AppTheme.obeseColor, text: 'Obese'),
  const ColorsCatalogModel(colors: AppTheme.extremeColor, text: 'Extreme'),
];
