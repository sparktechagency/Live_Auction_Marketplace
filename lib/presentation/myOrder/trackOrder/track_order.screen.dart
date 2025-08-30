import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../shared/widgets/appbar/custom_appbar.dart';
import 'controllers/track_order.controller.dart';

class TrackOrderScreen extends GetView<TrackOrderController> {
  const TrackOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: CustomAppBar(title: "Reviews", centerTitle: true),
        body: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
