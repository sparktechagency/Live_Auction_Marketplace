import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../infrastructure/theme/app_colors.dart';
import '../../../infrastructure/theme/text_styles.dart';
import '../../shared/widgets/appbar/custom_appbar.dart';
import 'controllers/product_selection.controller.dart';

class ProductSelectionScreen extends GetView<ProductSelectionController> {
  const ProductSelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Set Up Your Profile",
          centerTitle: true,
          //showBackButton: false,

        ),
        body: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 38.h,
              ),
              Text('What do you like to shop for?', style: AppTextStyles.H6_Regular,) ,

              SizedBox(
                height: 4.h,
              ),
              Text('Pick a fex to get Started', style: AppTextStyles.buttonRegular.copyWith(color: AppColors.neutral300),) ,
              SizedBox(
                height: 24.h,
              ),
          SizedBox(
            height: 448.h,
            child: GridView.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8, // Spacing between columns
                mainAxisSpacing: 8, // Spacing between rows
                childAspectRatio: 1, // Width/height ratio of each item
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(height: 50,width: 50,color: AppColors.primary50,);
              },
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}
