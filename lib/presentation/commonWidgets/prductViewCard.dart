import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../infrastructure/theme/app_colors.dart';
import '../../infrastructure/theme/text_styles.dart';
import '../../infrastructure/utils/app_images.dart';

class productDetilsCard extends StatefulWidget {
  final String imageUrl;

 final   bool? isShearActive;
  final int viewerCount;
  final String shopName;
  final String? productOwnerPicture;

  const productDetilsCard({
    super.key,
    required this.imageUrl,
    this.isShearActive=false,
    required this.viewerCount,
    required this.shopName,
    this.productOwnerPicture,
  });

  @override
  State<productDetilsCard> createState() => _productDetilsCardState();
}

class _productDetilsCardState extends State<productDetilsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.grey[800],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: widget.imageUrl.isNotEmpty
                ? Image.asset(
                    widget.imageUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey[600],
                            size: 40.sp,
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    color: Colors.grey[800],
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.grey[600],
                        size: 40.sp,
                      ),
                    ),
                  ),
          ),
          //Share icon
          if(isShearActive==)
          Positioned(
            top: 14.h,
            right: 13.w,
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: AppColors.neutral500,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppImages.interfaceShareShareTransmitStreamlineCore,
                  color: AppColors.neutral50,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 13.h,
            left: 12.w,
            right: 8.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                    color: AppColors.defaultTextColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child:
                          widget.productOwnerPicture != null &&
                              widget.productOwnerPicture!.isNotEmpty
                          ? Image.asset(
                              widget.productOwnerPicture!,
                              width: 16.w,
                              height: 16.w,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  AppImages.profilePic,
                                  width: 16.w,
                                  height: 16.w,
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              AppImages.profilePic,
                              width: 16.w,
                              height: 16.w,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: Text(
                    widget.shopName,
                    style: AppTextStyles.buttonRegular.copyWith(
                      color: AppColors.neutral50,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
