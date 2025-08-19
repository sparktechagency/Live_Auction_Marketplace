import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../infrastructure/utils/app_images.dart';
import '../shared/widgets/bottomNav/custom_nav_bar.dart';
import '../shared/widgets/bottomNav/nav_bar_model.dart';
import '../home/home.screen.dart';
import '../categories/categories.screen.dart';
import '../myOrder/my_order.screen.dart';
import '../Account/account.screen.dart';
import 'controllers/main_app.controller.dart';

class MainAppScreen extends GetView<MainAppController> {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => _buildCurrentScreen()),
      bottomNavigationBar: Obx(() => CustomBottomNavBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTabIndex,
        items: [
          CustomNavItem(
            svgAssetPath: AppImages.interfaceHome2DoorEntranceHomeHouseMapRoofRoundStreamlineCore,
            label: 'Home',
          ),
          CustomNavItem(
            svgAssetPath:  AppImages.interfaceSearchGlassSearchMagnifyingStreamlineCore,
            label: 'Categories',
          ),
          CustomNavItem(
            svgAssetPath: AppImages.buyerNavbar,
            label: 'Sell',
            isFloatingButton: true,
          ),
          CustomNavItem(
            svgAssetPath: AppImages.buyerNavbar,
            label: 'My Order',
          ),
          CustomNavItem(
            svgAssetPath: AppImages.interfaceSecurityShieldProfileShieldSecureSecurityProfilePersonStreamlineCore,

            label: 'Account',
          ),
        ],
      )),
    );
  }

  Widget _buildCurrentScreen() {
    switch (controller.currentIndex.value) {
      case 0:
        return const HomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:

        return _buildSellScreen();
      case 3:
        return const MyOrderScreen();
      case 4:
        return const AccountScreen();
      default:
        return const HomeScreen();
    }
  }

  Widget _buildSellScreen() {
    return const Center(
      child: Text(
        'Sell Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}