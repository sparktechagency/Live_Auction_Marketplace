import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_auction_marketplace/infrastructure/theme/text_styles.dart';

import '../../../infrastructure/theme/app_colors.dart';
import '../../../infrastructure/utils/app_images.dart';

class Selectioncard extends StatelessWidget {
  final String title;
  final String svgPath;
  final VoidCallback onTap;
  const Selectioncard({super.key, required this.title, required this.svgPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.neutral800,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                height: 14.86.h,
                width: 14.86.w,
                color: AppColors.neutral50,
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: AppTextStyles.paragraph_2_Regular.copyWith(
                  color: AppColors.neutral50,
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                AppImages
                    .interfaceArrowsButtonRightArrowRightKeyboardStreamlineCore,
                height: 14.86.h,
                width: 7.2.w,
                color: AppColors.neutral50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
