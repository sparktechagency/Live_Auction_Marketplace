import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/utils/app_images.dart';
import 'package:live_auction_marketplace/presentation/shared/widgets/buttons/primary_buttons.dart';

import '../../../commonWidgets/customTextFormFieldTwo.dart';
import '../../../shared/widgets/appbar/custom_appbar.dart';
import 'controllers/schedule_action_settings.controller.dart';

class StoreInformationScreen
    extends GetView<storeInformationController> {
  const StoreInformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Store Information", centerTitle: false),

      body: Padding(
        padding:   EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
            ),
            CustomTextFormFieldTwo(hintText: "Store Logo",suffixSvg: AppImages.interfaceAddSquareSquareRemoveCrossButtonsAddPlusButtonStreamlineCore, sufixIconHeight: 16,sufixIconWeight: 16,),
            SizedBox(
              height: 14.h,
            ),

            CustomTextFormFieldTwo(hintText: "Store Name",),
            SizedBox(
              height: 24.h,
            ),
            PrimaryButton(width: double.infinity,onPressed: (){}, text: "Update")
          ],
        ),
      ),
    );
  }
}
