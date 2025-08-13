import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/theme/app_colors.dart';
import 'package:live_auction_marketplace/infrastructure/theme/text_styles.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        centerTitle: true,
      ),
      body:   Center(
        child: Text(
          'Hi Bro!',
          style: AppTextStyles.H1_Bold.copyWith(color: AppColors.primary1000),
        ),
      ),
    );
  }
}
