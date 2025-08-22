import 'dart:math' as math;

import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/navigation/routes.dart';
import 'package:live_auction_marketplace/infrastructure/theme/app_colors.dart';
import 'package:live_auction_marketplace/infrastructure/theme/text_styles.dart';
import 'package:live_auction_marketplace/infrastructure/utils/app_images.dart';
import 'package:live_auction_marketplace/presentation/commonWidgets/gridDetailsCard.dart';
import 'package:live_auction_marketplace/presentation/shared/widgets/customSearchBar/customSearchField.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: Stack(
        children: [
          Obx(() {
            return Scaffold(
              appBar: controller.searchFieldSelected.value == false
                  ? AppBar(
                      leading: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                            child: Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                color: AppColors.defaultTextColor,
                                borderRadius: BorderRadius.circular(100.r),
                              ),
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.asset(
                                    AppImages.productOwner,
                                    width: 32.w,
                                    height: 32.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: AppTextStyles.buttonRegular.copyWith(
                              color: AppColors.neutral300,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Willbeamin',
                            style: AppTextStyles.paragraph_1_Regular.copyWith(
                              color: AppColors.neutral50,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        Padding(
                          padding: EdgeInsets.only(right: 24.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SvgPicture.asset(AppImages.notificatioContainer),
                              SizedBox(width: 12.w),
                              SvgPicture.asset(AppImages.giftContainer),
                            ],
                          ),
                        ),
                      ],
                      foregroundColor: AppColors.neutral50,
                    )
                  : null, // or a different AppBar if needed
              body: Obx(
                () => Column(
                  children: [
                    SizedBox(height: 20.h),
      
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomSearchField(
                              controller: controller.searchController,
                              focusNode: controller.searchFocusNode,
                              hintText: 'Search for products',
                              onChanged: controller.onSearchChanged,
                              onSubmitted: controller.onSearchSubmitted,
                              onClear: controller.clearSearch,
                              textInputAction: TextInputAction.search,
                              onTap: () {
                                controller
                                    .onSearchFieldSelected(); // Add this method to your controller
                              },
                            ),
                          ),
      
                          if (controller.searchFieldSelected.value)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:   EdgeInsets.only(left: 30.w,right: 10.w),
                                child: GestureDetector(
                                  onTap: (){
                                    controller.onSearchFieldDeselected();
                                    FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                  child: SvgPicture.asset(
                                    AppImages
                                        .interfaceDelete1RemoveAddButtonButtonsDeleteStreamlineCore,
                                    color: AppColors.neutral50,
                                    height: 16.h,
                                    width: 16.w,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
      
                    SizedBox(height: 16.h),
      
                    // Category Filter Buttons
                    if (controller.searchFieldSelected.value == false)
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
                                      controller.onCategorySelected(index);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100.r,
                                        ),
                                        color:
                                            controller
                                                    .selectedTypeButtonIndex
                                                    .value ==
                                                index
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
                                                  color:
                                                      controller
                                                              .selectedTypeButtonIndex
                                                              .value ==
                                                          index
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
                    if (controller.searchFieldSelected.value)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.w),
                        child: SizedBox(
                          height: 32.h,
                          child: ListView.builder(
                            itemCount: controller.filterButtonData.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: Obx(() {
                                  return GestureDetector(
                                    onTap: () {
                                      controller.onFilterButtonSelect(index);
                                    },
                                    child: Padding(
                                      padding: index==0?  EdgeInsets.only(left: 20.w):EdgeInsets.all(0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            100.r,
                                          ),
                                          color:
                                              controller
                                                      .selectedFilterButtonIndex
                                                      .value ==
                                                  index
                                              ? AppColors.primary1000
                                              : AppColors.neutral800,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 13.h,
                                              vertical: 7.w,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  controller
                                                      .filterButtonData[index]['buttonName'],
                                                  style: AppTextStyles
                                                      .buttonRegular
                                                      .copyWith(
                                                        color:
                                                            controller
                                                                    .selectedFilterButtonIndex
                                                                    .value ==
                                                                index
                                                            ? AppColors.neutral950
                                                            : AppColors.neutral50,
                                                      ),
                                                ),

                                                // if (index == 0)
                                                //   Padding(
                                                //     padding: EdgeInsets.only(
                                                //       left: 8.w,
                                                //     ),
                                                //     child: SvgPicture.asset(
                                                //       AppImages.filter,
                                                //       height: 16.h,
                                                //       width: 16.w,
                                                //       color:
                                                //           controller
                                                //                   .selectedFilterButtonIndex
                                                //                   .value ==
                                                //               index
                                                //           ? AppColors.neutral950
                                                //           : AppColors.neutral50,
                                                //     ),
                                                //   ),
                                              ],
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
                    SizedBox(height: 20.h),
      
                    // Search Results Info (Optional)
                    Obx(() {
                      if (controller.searchQuery.value.isNotEmpty) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Text(
                                '${controller.items.length} products Found',
                                style: AppTextStyles.paragraph_2_Regular.copyWith(
                                  color: AppColors.neutral50,
                                ),
                              ),
      
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
      
                    if (controller.searchQuery.value.isNotEmpty)
                      SizedBox(height: 12.h),
      
                    // Grid View with Search Results
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Obx(() {
                          if (controller.isSearching.value) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
      
                          if (controller.items.isEmpty) {
                            return _buildEmptyState();
                          }
      
                          return GridView.builder(
                            controller: controller.scrollController,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12.w,
                                  mainAxisSpacing: 8.h,
                                  childAspectRatio: 0.67,
                                ),
                            itemCount: controller.items.length,
                            itemBuilder: (context, index) {
                              final item = controller.items[index];
                              return GestureDetector(
                                onTap: (){
                                  if(  item['isLive']==false){
                                    Get.toNamed(Routes.PRODUCT_DETAILS);
                                  }
                                  else{
                                    Get.toNamed(Routes.LIVE_STREAMMING);
                                  }
      
                                },
                                child: gridCard(
                                  imageUrl: item['imageUrl'] ?? '',
                                  title: item['title'] ?? '',
                                  isLive: item['isLive'] ?? false,
                                  viewerCount: item['viewerCount'] ?? 0,
                                  shopName: item['shopName'] ?? '',
                                  productOwnerPicture: item['ownerPic'],
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                    Obx(() {
                      if (controller.showLoadMoreIcon.value) {
                        return Transform.rotate(
                          angle: 90 * (math.pi / 180),
                          child: GestureDetector(
                            onTap: controller.loadMoreItems,
                            child: SvgPicture.asset(
                              AppImages
                                  .interfaceArrowsRightCircle2ArrowKeyboardCircleButtonRightStreamlineCore,
                              height: 16.h,
                              width: 16.h,
                              color: AppColors.primary400,
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink(); // or Container() for empty state
                    }),
                  ],
                ),
              ),
            );
          }),
          Transform.translate(
            offset: Offset(80, -31),
            child: Container(
              height: 114.w,
              width: 114.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000.r),
      
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFE5B045).withOpacity(0.2),
                    // Same color with opacity
                    spreadRadius: 120,
                    // How far the shadow spreads
                    blurRadius: 70,
                    // How blurred the shadow is
                    offset: Offset(0, 0), // No offset for even spread
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.interfaceSearchGlassSearchMagnifyingStreamlineCore,
            height: 64.h,
            width: 64.w,
            color: AppColors.neutral400,
          ),
          SizedBox(height: 16.h),
          Text(
            'No products found',
            style: AppTextStyles.paragraph_1_Regular.copyWith(
              color: AppColors.neutral400,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Try searching with different keywords',
            style: AppTextStyles.buttonRegular.copyWith(
              color: AppColors.neutral500,
            ),
          ),
          SizedBox(height: 24.h),
          GestureDetector(
            onTap: controller.clearSearch,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.primary1000,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Text(
                'Clear Search',
                style: AppTextStyles.buttonRegular.copyWith(
                  color: AppColors.neutral950,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
