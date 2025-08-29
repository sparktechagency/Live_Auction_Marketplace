import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:live_auction_marketplace/presentation/commonWidgets/customTextFormFieldTwo.dart';

import '../../../shared/widgets/appbar/custom_appbar.dart';
import '../../../shared/widgets/customDropDown.dart';
import '../../../shared/widgets/custom_text_form_field.dart';
import '../../../shared/widgets/buttons/primary_buttons.dart';
import 'controllers/give_away.controller.dart';

class GiveAwayScreen extends GetView<GiveAwayController> {
  const GiveAwayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: CustomAppBar(title: "Give Away Settings", centerTitle: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32.h),

                  // Give Away Title Field
                  CustomTextFormFieldTwo(
                    hintText: '\$25 Gift for Top Sharer!',
                    labelText: 'Enter Give Away Title',
                    controller: controller.titleController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a give away title';
                      }
                      if (value.trim().length < 3) {
                        return 'Title must be at least 3 characters long';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 24.h),

                  // Give Away Type Dropdown
                  Obx(
                        () => CustomDropDown(
                      hintText: 'Select give away type',
                      errorText: 'Please select a give away type',
                      selectedValue: controller.selectedGiveAwayType.value,
                      items: controller.giveAwayTypeList,
                      onChanged: controller.updateGiveAwayType,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a give away type';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 24.h),

                  // Attach to Live Auction Dropdown
                  Obx(
                        () => CustomDropDown(
                      hintText: 'Select auction to attach',
                      errorText: 'Please select an auction',
                      selectedValue: controller.selectedAttachedAuction.value,
                      items: controller.attachedAuctionList,
                      onChanged: controller.updateAttachedAuction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select an auction to attach';
                        }
                        return null;
                      },
                    ),
                  ),

                  SizedBox(height: 32.h),

                  // Submit Button
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }
                    return PrimaryButton(
                      width: double.infinity,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.submitGiveAway();
                        }
                      },
                      text: 'Create Give Away',
                    );
                  }),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}