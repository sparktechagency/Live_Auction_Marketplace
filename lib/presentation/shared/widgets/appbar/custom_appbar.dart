import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../infrastructure/theme/app_colors.dart';
import '../../../../infrastructure/theme/text_styles.dart';
import '../../../../infrastructure/utils/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color backgroundColor;
  final Color iconColor;
  final String? leadingIcon;
  final Color? leadingIconColor;

  // final TextStyle titleStyle;
  final Widget? customLeading; // Add custom leading support

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
    this.actions,
    this.centerTitle = false,
    this.backgroundColor = AppColors.neutral950,
    this.iconColor = Colors.black,
    this.customLeading, this.leadingIcon, this.leadingIconColor, // Optional custom leading
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,

      leading:
          customLeading ??
          (showBackButton
              ? IconButton(
                  icon: Padding(
                    padding:   EdgeInsets.only(left: 4.w),
                    child: SvgPicture.asset(
                     leadingIcon ?? AppImages
                          .interfaceArrowsButtonLeftArrowKeyboardLeftStreamlineCore,
                      height: 16.h,
                      width: 16.w,
                      color: leadingIconColor ?? AppColors.defaultTextColor,
                    ),
                  ),
                  onPressed: onBackPressed ?? () => Get.back(),
                )
              : null),
      title: Text(
        title,
        style: AppTextStyles.H6_Regular.copyWith(color: AppColors.defaultTextColor),
      ),
      actions: actions,

      scrolledUnderElevation: 0,
      elevation: 0, // Add elevation to match original
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
