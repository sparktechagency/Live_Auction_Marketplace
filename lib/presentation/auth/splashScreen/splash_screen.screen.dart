import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';

import '../../../../infrastructure/theme/app_colors.dart';
import '../../../../infrastructure/theme/text_styles.dart';
import 'controllers/splash_screen.controller.dart';

class SplashScreenScreen extends StatefulWidget {
  const SplashScreenScreen({super.key});

  @override
  State<SplashScreenScreen> createState() => _SplashScreenScreenState();
}

class _SplashScreenScreenState extends State<SplashScreenScreen> {
final SplashScreenController splashScreenController = Get.find<SplashScreenController>();
  @override
  void initState() {

    super.initState();
    splashScreenController.startSplashTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(
        child: Text(
          'MouvBid',
          style: AppTextStyles.H1_Bold.copyWith(color: AppColors.primary1000),
        ).animate().fade(
        delay: Duration(milliseconds: 600))
      ),
    );
  }
}
