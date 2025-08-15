import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/theme/text_styles.dart';
import 'package:live_auction_marketplace/presentation/shared/widgets/buttons/primary_buttons.dart';

import '../../../infrastructure/theme/app_colors.dart';
import '../../../infrastructure/utils/app_images.dart';
import '../../shared/widgets/appbar/custom_appbar.dart';
import 'controllers/seller_information.controller.dart';

class SellerInformationScreen extends GetView<SellerInformationController> {
  const SellerInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Seller Information',
        centerTitle: true,
        leadingIcon:
            AppImages.interfaceArrowsButtonLeftArrowKeyboardLeftStreamlineCore,
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
        //     child: Text(
        //       "Skip Now",
        //       style: AppTextStyles.captionRegular.copyWith(color: AppColors.primary400),
        //     ),
        //   )
        // ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            height: 8.h,
            child: Obx(
              () => LinearProgressIndicator(
                value: controller.progress,
                backgroundColor: AppColors.neutral800,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.primary1000,
                ),
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
          ),

          // Page Content
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onPageChanged,
              children: [_buildSelfieScreen(), _buildIDInfoScreen()],
            ),
          ),

          // Bottom Buttons
          _buildBottomButtons(),
        ],
      ),
    );
  }

  Widget _buildSelfieScreen() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Hey Alex!',
            style: AppTextStyles.H5_Medium,
          ),
          SizedBox(height:4.h),
          Text(
            "You’re applying for Seller",
            style: AppTextStyles.buttonRegular,
          ),
          SizedBox(height: 24.h),

          // Selfie Circle
          GestureDetector(
            onTap: (){},
            child: DottedBorder(

              options: CircularDottedBorderOptions(
                dashPattern: [5, 5],
                color: AppColors.neutral200,
                strokeWidth: 1.w,
               borderPadding: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
              ),
              child: Container(
                width: 124.w,
                height: 124.w,
                decoration: BoxDecoration(
                  color: AppColors.neutral800,
                  shape: BoxShape.circle,

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   SvgPicture.asset(AppImages.roundedCamera,height: 24.h,width: 24.w,),
                    SizedBox(height: 12.h),
                    Text(
                      'Take Selfie',
                      style: AppTextStyles.buttonRegular ,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 120.h),
        ],
      ),
    );
  }

  Widget _buildIDInfoScreen() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text(
              'Enter your NId Information',
              style: AppTextStyles.H4_Bold.copyWith(color: Colors.white),
            ),
            SizedBox(height: 40.h),

            // Front of ID Card
            Text(
              'Front of ID Card',
              style: AppTextStyles.buttonRegular.copyWith(color: Colors.white),
            ),
            SizedBox(height: 8.h),
            Text(
              'please ensure a clear photo',
              style: AppTextStyles.captionRegular.copyWith(
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: 16.h),

            _buildUploadBox(),
            SizedBox(height: 32.h),

            // Back of ID Card
            Text(
              'Back of ID Card',
              style: AppTextStyles.buttonRegular.copyWith(color: Colors.white),
            ),
            SizedBox(height: 8.h),
            Text(
              'please ensure a clear photo',
              style: AppTextStyles.captionRegular.copyWith(
                color: Colors.grey[400],
              ),
            ),
            SizedBox(height: 16.h),

            _buildUploadBox(),
            SizedBox(height: 32.h),

            // Business ID
            Text(
              'Business ID (optional)',
              style: AppTextStyles.buttonRegular.copyWith(color: Colors.white),
            ),
            SizedBox(height: 16.h),

            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: '12445544',
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
              ),
            ),
            SizedBox(height: 32.h),

            // Seller Address
            Text(
              'Seller Address',
              style: AppTextStyles.buttonRegular.copyWith(color: Colors.white),
            ),
            SizedBox(height: 16.h),

            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Rhode Island, USA',
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 16.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadBox() {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey[600]!,
          style: BorderStyle.solid,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add, size: 32.sp, color: Colors.grey[400]),
          SizedBox(height: 8.h),
          Text(
            'Upload\nPhoto',
            textAlign: TextAlign.center,
            style: AppTextStyles.captionRegular.copyWith(
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: EdgeInsets.all(24.w),
      child: Obx(
        () => Row(
          children: [
            if (controller.currentPage.value < 1)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    PrimaryButton(
                      width: 148.w,
                      backgroundColor: AppColors.neutral800,
                      textColor: AppColors.defaultTextColor,
                      onPressed: () {},
                      text: "Save",
                    ),

                    PrimaryButton(
                      width: 148.w,
                      onPressed: () {
                        controller.nextPage();
                      },
                      text: "Next",
                    ),
                  ],
                ),
              ),

            if (controller.currentPage.value == 1)
              Expanded(
                child: PrimaryButton(
                  width: double.infinity,
                  onPressed: () {},
                  text: 'Sign Up',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
