import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/theme/app_colors.dart';
import '../../../../infrastructure/theme/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final bool isActive;
  final String? svgAsset;
  final double iconSize;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width,
    this.backgroundColor,
    this.isActive = true,
    this.iconSize = 20,
    this.svgAsset,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.neutral950; // Custom color when inactive
            }
            return backgroundColor ?? AppColors.primary800;
          }),
          padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          elevation: WidgetStateProperty.all(0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgAsset != null) ...[
              SvgPicture.asset(
                svgAsset!,
                width: iconSize,
                height: iconSize,
                color: Colors.white,
              ),
                SizedBox(width: 8.w),
            ],
            Text(
              text,
              style: AppTextStyles.paragraph_2_Medium.copyWith(
                color: AppColors.neutral950,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
