import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/theme/app_colors.dart';
import 'package:live_auction_marketplace/infrastructure/theme/text_styles.dart';
import 'package:video_player/video_player.dart';

import '../../../infrastructure/utils/app_images.dart';
import '../../commonWidgets/customTimer.dart';

import '../../commonWidgets/glassButton.dart';
import 'controllers/live_streamming.controller.dart';

class LiveStreammingScreen extends GetView<LiveStreammingController> {
  const LiveStreammingScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: Stack(
          children: [
            // Full screen video player
            Positioned.fill(
              child: Obx(() {
                // FIXED: Better error handling and loading states
                if (controller.hasError.value) {
                  return Container(
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 48.sp,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Video Error',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              controller.errorMessage.value,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          ElevatedButton(
                            onPressed: () => controller.initializeVideoPlayer(),
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (controller.isLoading.value) {
                  return Container(
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: AppColors.primary1000,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'Loading video...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (controller.videoPlayerController.value != null &&
                    controller
                        .videoPlayerController
                        .value!
                        .value
                        .isInitialized) {
                  return FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller
                          .videoPlayerController
                          .value!
                          .value
                          .size
                          .width,
                      height: controller
                          .videoPlayerController
                          .value!
                          .value
                          .size
                          .height,
                      child: VideoPlayer(
                        controller.videoPlayerController.value!,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'Video not available',
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  );
                }
              }),
            ),


            ///-------- main ui compnent is here
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              // CRITICAL: Must have bottom constraint
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // Space between components
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 24.h),
                        _profile(),
                      ],
                    ),
                    // Bottom section with tab bar
                    _tabBarComponent(),
                    SizedBox(height: 24.h),
                    writeSomething(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  ///--------------profile component-------------
  Widget _profile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 32.w,
          width: 32.w,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100.r)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.asset(AppImages.productOwner, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jirah Shop',
              style: AppTextStyles.paragraph_2_Regular.copyWith(
                color: AppColors.neutral950,
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppImages.ratingsIcon2,
                  height: 12.w,
                  width: 12.w,
                ),
                SizedBox(width: 4.w),
                Text(
                  '4.9',
                  style: AppTextStyles.buttonRegular.copyWith(
                    color: AppColors.neutral950,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.primary400,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 1.h,
                    ),
                    child: Text(
                      'Follow',
                      style: AppTextStyles.buttonRegular.copyWith(
                        color: AppColors.neutral950,
                        height: 1.5.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  ///--------------svg button component-------------
  Widget _tabBarComponent() {
    return Padding(
      padding:   EdgeInsets.only(right: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ------------------send gift-----------------------
          SvgPicture.asset(AppImages.giftIcon),
          SizedBox(height: 4.h),
          Text('Give\nway', style: AppTextStyles.buttonRegular),

          /// ------------------View Count-----------------------
          SizedBox(height: 24.h),
          SvgPicture.asset(
            AppImages.interfaceEditViewEyeEyeballOpenViewStreamlineCore,
            color: AppColors.neutral50,
            height: 16.h,
            width: 16.w,
          ),
          SizedBox(height: 4.h),
          Text('1.2k', style: AppTextStyles.buttonRegular),

          /// ------------------Shear -----------------------
          SizedBox(height: 24.h),
          SvgPicture.asset(
            AppImages.interfaceShareShareTransmitStreamlineCore,
            color: AppColors.neutral50,
            height: 16.h,
            width: 16.w,
          ),
          SizedBox(height: 4.h),
          Text('Share', style: AppTextStyles.buttonRegular),

          /// ------------------wallet -----------------------
          SizedBox(height: 24.h),
          SvgPicture.asset(
            AppImages.wallet_svgrepo_com_1,
            color: AppColors.neutral50,
            height: 16.h,
            width: 16.w,
          ),
          SizedBox(height: 4.h),
          Text('wallet', style: AppTextStyles.buttonRegular),

          /// ------------------wallet -----------------------
          SizedBox(height: 24.h),
          SvgPicture.asset(
            AppImages.storeIcon,
            color: AppColors.neutral50,
            height: 16.h,
            width: 16.w,
          ),
          SizedBox(height: 4.h),
          Text('View\nShop', style: AppTextStyles.buttonRegular),
        ],
      ),
    );
  }

  ///--------------write button and timer component-------------

  Widget writeSomething() {
    final GlobalKey<CountdownTimerState> timer1Key = GlobalKey();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GlassButton(text: 'Write Something', width: 252.w),
        CountdownTimer(
          key: timer1Key,
          initialSeconds: 12,
          size: 48.w,
          progressColor: AppColors.primary1000,
          backgroundColor: AppColors.neutral800,
          strokeWidth: 4.w,
          textStyle: AppTextStyles.captionRegular.copyWith(
            color: AppColors.neutral50,
          ),
          onStart: () => print('Timer 1 started!'),
          onComplete: () => print('Timer 1 completed!'),
          onReset: () => print('Timer 1 reset!'),
        ),
      ],
    );
  }
}
