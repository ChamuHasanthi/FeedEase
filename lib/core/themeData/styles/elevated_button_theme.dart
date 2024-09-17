import 'package:feeding_application/core/themeData/styles/app_colors.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(AppColors.azureBlue),
  foregroundColor: const WidgetStatePropertyAll(AppColors.white),
  shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
));
