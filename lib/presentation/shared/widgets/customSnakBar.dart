import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../infrastructure/theme/app_colors.dart';
import '../../../infrastructure/theme/text_styles.dart';

class CustomSnackbar {
  static void show({
    required String title,
    required String message,
    Color? backgroundColor,
    Color? textColor,
    SnackPosition position = SnackPosition.TOP,
    Duration duration = const Duration(seconds: 2),
    bool isDismissible = true,
    EdgeInsets? margin,
    EdgeInsets? padding,
    double? borderRadius,
    int maxLines = 3,
    double? titleFontSize,
    double? messageFontSize,
    FontWeight? titleFontWeight,
    Curve? forwardAnimationCurve,
  }) {
    Get.snackbar(
      "",
      "",
      backgroundColor: backgroundColor ?? AppColors.primary200,
      snackPosition: position,
      borderRadius: borderRadius ?? 8.r,
      margin: margin ?? EdgeInsets.all(16.r),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      titleText: Text(
        title,
        style: AppTextStyles.paragraph_1_Bold.copyWith(
          fontSize: titleFontSize ?? 18.sp,
          fontWeight: titleFontWeight ?? FontWeight.bold,
          color: textColor ?? AppColors.red700,
        ),
      ),
      messageText: Text(
        message,
        style: AppTextStyles.buttonRegular.copyWith(
          fontSize: messageFontSize ?? 14.sp,
          color: textColor ?? AppColors.red700,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
      duration: duration,
      isDismissible: isDismissible,
      //forwardAnimationCurve: forwardAnimationCurve ?? Curves.easeOutBack,
    );
  }

  // Predefined snackbar types for common use cases
  static void showError({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      title: title,
      message: message,
      backgroundColor: AppColors.primary200,
      textColor: AppColors.red700,
      duration: duration,
    );
  }

  static void showSuccess({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      title: title,
      message: message,
      backgroundColor: AppColors.green100 ,
      textColor: AppColors.green700 ,
      duration: duration,
    );
  }

  static void showWarning({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      title: title,
      message: message,
      backgroundColor: AppColors.primary400 ,
      textColor: AppColors.primary950 ,
      duration: duration,
    );
  }

  static void showInfo({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    show(
      title: title,
      message: message,
      backgroundColor: AppColors.green300 ,
      textColor: AppColors.green700 ,
      duration: duration,
    );
  }
}