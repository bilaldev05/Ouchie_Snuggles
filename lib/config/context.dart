import 'package:flutter/material.dart';
import 'theme.dart';

extension ContextExtensions on BuildContext {
  // MediaQuery helpers
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  // Theme helpers
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  // Direct color access
  Color get primaryColor => AppColors.primary;
  Color get secondaryColor => AppColors.secondary;
  Color get tertiaryColor => AppColors.tertiary;
  Color get backgroundColor => AppColors.background;
  Color get errorColor => AppColors.error;
  Color get successColor => AppColors.success;

  // Text colors
  Color get textPrimary => AppColors.textPrimary;
  Color get textSecondary => AppColors.textSecondary;
  Color get textTertiary => AppColors.textTertiary;
}
