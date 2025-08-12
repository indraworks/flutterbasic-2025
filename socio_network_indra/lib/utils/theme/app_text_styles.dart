import 'package:flutter/material.dart';

import 'app_colors.dart';

import '../responsive/size_config.dart';

//semua Style for Konsistensi

class AppTextStyles {
  //big headline

  static TextStyle headLine(BuildContext context, {bool isDark = false}) {
    return TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal(context) * 6, //responsive
      fontWeight: FontWeight.bold,
      color: isDark ? AppColors.textDark : AppColors.textLight,
    );
  }

  //sub headaline
  static TextStyle subheadLine(BuildContext context, {bool isDark = false}) {
    return TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal(context) * 4.5,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.textDark : AppColors.textLight,
    );
  }

  //body text yg regulas
  static TextStyle body(BuildContext context, {bool isDark = false}) {
    return TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal(context) * 4,
      color: isDark ? AppColors.textDark : AppColors.textLight,
    );
  }

  //small text
  static TextStyle small(BuildContext context, {bool isDark = false}) {
    return TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal(context) * 3.5,
      color: isDark ? AppColors.textDark : AppColors.textLight,
    );
  }
}
