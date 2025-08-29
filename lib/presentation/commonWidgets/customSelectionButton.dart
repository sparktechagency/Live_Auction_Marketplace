import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../infrastructure/theme/app_colors.dart';
import '../../infrastructure/theme/text_styles.dart';

class SelectableButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeBgColor;
  final Color inactiveBgColor;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final double borderRadius;

  const SelectableButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.activeBgColor = AppColors.primary1000, // Default primary
    this.inactiveBgColor = AppColors.neutral800, // Default neutral
    this.activeTextColor = Colors.white,
    this.inactiveTextColor = Colors.grey,
    this.borderRadius = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: isSelected ?activeBgColor : inactiveBgColor
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 7.w),
            child: Text(
              text,
              style: AppTextStyles.buttonRegular.copyWith(
                color: isSelected ? AppColors.neutral950 : AppColors.neutral50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

