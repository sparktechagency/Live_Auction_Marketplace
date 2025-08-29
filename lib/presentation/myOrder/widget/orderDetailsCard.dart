import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_auction_marketplace/infrastructure/theme/app_colors.dart';
import 'package:live_auction_marketplace/infrastructure/theme/text_styles.dart';

import '../../../infrastructure/utils/app_images.dart';

class Orderdetailscard extends StatelessWidget {
  final Map<String, dynamic>? orderData;

  const Orderdetailscard({
    super.key,
    this.orderData,
  });

  @override
  Widget build(BuildContext context) {

    final productName = orderData?['productName'] ?? 'Vintage Rolex Watch';
    final size = orderData?['size'] ?? 'One Size';
    final price = orderData?['price'] ?? '\$5,000';
    final status = orderData?['status'] ?? 'pending';
    final imageUrl = orderData?['image'] ?? AppImages.watchPic;

    return SizedBox(
      height: 120.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 120.w,
            width: 120.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.r),
              child: Image.asset(imageUrl, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: AppTextStyles.paragraph_1_Regular.copyWith(
                  color: AppColors.neutral50,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                size,
                style: AppTextStyles.paragraph_2_Regular.copyWith(
                  color: AppColors.neutral500,
                ),
              ),
              Spacer(),
              Text(
                price,
                style: AppTextStyles.paragraph_1_Medium.copyWith(
                  color: AppColors.neutral50,
                ),
              ),
              Spacer(),
              Text(
                _getStatusText(status),
                style: AppTextStyles.paragraph_2_Medium.copyWith(
                  color: _getStatusColor(status),
                ),
              ),
              SizedBox(
                height: 2.h,
              )
            ],
          ),
        ],
      ),
    );
  }

  // Method to get status color based on status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return AppColors.primary600; // Yellow/Orange for pending
      case 'cancel':
        return AppColors.red500; // Red for cancelled
      case 'delivered':
        return AppColors.green500; // Green for delivered
      default:
        return AppColors.primary600; // Default color
    }
  }

  // Method to format status text (capitalize first letter)
  String _getStatusText(String status) {
    return status.substring(0, 1).toUpperCase() + status.substring(1);
  }
}