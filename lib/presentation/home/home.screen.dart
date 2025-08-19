import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/theme/app_colors.dart';
import 'package:live_auction_marketplace/infrastructure/theme/text_styles.dart';
import 'package:live_auction_marketplace/presentation/shared/widgets/buttons/primary_buttons.dart';
import '../../infrastructure/utils/app_images.dart';
import '../commonWidgets/gridDetailsCard.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,

          foregroundColor: AppColors.neutral50,
        ),
        body: Obx(
              () =>
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SizedBox(
                      height: 32.h,
                      child: ListView.builder(
                        itemCount: controller.buttonData.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Obx(() {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedButtonIndex.value = index;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: controller.selectedButtonIndex
                                        .value == index
                                        ? AppColors.primary1000
                                        : AppColors.neutral800,

                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 13.h,
                                        vertical: 7.w,
                                      ),
                                      child: Text(
                                        controller
                                            .buttonData[index]['buttonName'],
                                        style: AppTextStyles.buttonRegular
                                            .copyWith(
                                          color: controller.selectedButtonIndex
                                              .value == index
                                              ? AppColors.neutral950
                                              : AppColors.neutral50,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 22.h),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 8.h,
                          childAspectRatio: 0.67,
                        ),
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          final item = controller.items[index];
                          return gridCard(
                            imageUrl: item['imageUrl'] ?? '',
                            title: item['title'] ?? '',
                            isLive: item['isLive'] ?? false,
                            viewerCount: item['viewerCount'] ?? 0,
                            shopName: item['shopName'] ?? '',
                            productOwnerPicture: item['ownerPic'],
                          );
                        },
                      ),
                    ),
                  ),

                  Transform.rotate(
                    angle: 90 * (math.pi / 180),
                    child: GestureDetector(
                      onTap: () {
                        controller.loadMoreItems();
                      },
                      child: SvgPicture.asset(
                        AppImages
                            .interfaceArrowsRightCircle2ArrowKeyboardCircleButtonRightStreamlineCore,
                        height: 16.h,
                        width: 16.w,
                        color: AppColors.primary400,
                      ),
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
