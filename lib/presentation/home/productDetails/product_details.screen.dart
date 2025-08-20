import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../infrastructure/utils/app_images.dart';
import '../../commonWidgets/prductViewCard.dart';
import '../../shared/widgets/appbar/custom_appbar.dart';
import 'controllers/product_details.controller.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  const ProductDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Product details",
        centerTitle: true,
        leadingIcon: AppImages
            .interfaceArrowsButtonLeftArrowKeyboardLeftStreamlineCore,
      ),
      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

           children: [
            productDetilsCard(imageUrl: AppImages.product1 , isShearActive: false, viewerCount: 5, shopName: 'tom',productOwnerPicture: AppImages.productOwner,)
          ],
        ),
      ),
    );
  }
}
