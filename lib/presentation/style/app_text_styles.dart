import 'package:bare_flutter_ui/presentation/style/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle header = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heroTitle = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle body = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 14,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.textPrimary,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle chipText = TextStyle(
    color: AppColors.textPrimary,
    fontSize: 12,
  );
}
