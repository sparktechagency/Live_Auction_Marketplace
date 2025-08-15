import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerInformationController extends GetxController {
  // Page Controller for PageView
  PageController pageController = PageController();


  // Observable variables
  final currentPage = 0.obs;
  final totalPages = 2;


  final businessIdController = TextEditingController();
  final addressController = TextEditingController();


  double get progress => (currentPage.value + 1) / totalPages;

  @override
  void onInit() {
    super.onInit();

    businessIdController.text = '12445544';
    addressController.text = 'Rhode Island, USA';
  }

  @override
  void onClose() {
    pageController.dispose();
    businessIdController.dispose();
    addressController.dispose();
    super.onClose();
  }

  // Navigate to next page
  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      if (pageController.hasClients) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    } else {
      // Handle final submission
      _submitSellerInformation();
    }
  }

  // Navigate to previous page
  void previousPage() {
    if (currentPage.value > 0) {
      if (pageController.hasClients) {
        pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // Handle page change
  void onPageChanged(int page) {
    currentPage.value = page;
  }

  // Handle selfie capture
  void takeSelfie() {
    // TODO: Implement camera functionality
    Get.snackbar('Info', 'Camera functionality to be implemented');
  }

  // Handle ID photo upload
  void uploadIdPhoto(bool isFront) {
    // TODO: Implement photo picker functionality
    Get.snackbar('Info', 'Photo picker functionality to be implemented');
  }

  // Validate current page data
  bool _validateCurrentPage() {
    switch (currentPage.value) {
      case 0:
      // Validate selfie is taken
      // TODO: Add selfie validation
        return true;
      case 1:
      // Validate ID information
      // TODO: Add ID validation
        return addressController.text.isNotEmpty;
      case 2:
        return true;
      default:
        return false;
    }
  }

  // Save current page data
  void saveCurrentPage() {
    if (_validateCurrentPage()) {
      Get.snackbar('Success', 'Data saved successfully');
    } else {
      Get.snackbar('Error', 'Please fill all required fields');
    }
  }

  // Submit seller information
  void _submitSellerInformation() {
    if (_validateAllPages()) {
      // TODO: Implement API call to submit seller information
      Get.snackbar('Success', 'Seller information submitted successfully!');

      // Navigate to next screen or close
      // Get.offNamed('/dashboard'); // Example navigation
    } else {
      Get.snackbar('Error', 'Please complete all required information');
    }
  }

  // Validate all pages
  bool _validateAllPages() {
    // TODO: Add comprehensive validation for all pages
    return addressController.text.isNotEmpty;
  }

  // Skip the process
  void skipProcess() {
    Get.dialog(
      AlertDialog(
        title: const Text('Skip Seller Registration?'),
        content: const Text('You can complete this process later from your profile settings.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              // TODO: Navigate to main app or dashboard
              Get.snackbar('Info', 'Seller registration skipped');
            },
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }
}