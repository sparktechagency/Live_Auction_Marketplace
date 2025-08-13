import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import '../theme/app_colors.dart';

class CustomPageLoading extends StatelessWidget {
  const CustomPageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(color: AppColors.primary800, size: 60.0),
    );
  }
}