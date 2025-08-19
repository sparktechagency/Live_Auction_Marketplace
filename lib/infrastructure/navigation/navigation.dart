import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/auth/splashScreen/splash_screen.screen.dart';
import '../../presentation/screens.dart';
import '../../presentation/main_app/main_app.screen.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'bindings/controllers/main_app.controller.binding.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  EnvironmentsBadge({required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.MAIN_APP,
      page: () => const MainAppScreen(),
      binding: MainAppControllerBinding(),
    ),
    GetPage(
      name: Routes.SPLASH_SCREEN,
      page: () => const SplashScreenScreen(),
      binding: SplashScreenControllerBinding(),
    ),
    GetPage(
      name: Routes.ROLE_SELECTION,
      page: () => const RoleSelectionScreen(),
      binding: RoleSelectionControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP_WITH_EMAIL,
      page: () => const SignUpWithEmailScreen(),
      binding: SignUpWithEmailControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpScreen(),
      binding: SignUpControllerBinding(),
    ),
    GetPage(
      name: Routes.SUCCESS_SCREEN,
      page: () => const SuccessScreenScreen(),
      binding: SuccessScreenControllerBinding(),
    ),
    GetPage(
      name: Routes.LOG_IN,
      page: () => const LogInScreen(),
      binding: LogInControllerBinding(),
    ),
    GetPage(
      name: Routes.VERIFY_EMAIL,
      page: () => const VerifyEmailScreen(),
      binding: VerifyEmailControllerBinding(),
    ),
    GetPage(
      name: Routes.OTP_VERIFICATION,
      page: () => const OtpVerificationScreen(),
      binding: OtpVerificationControllerBinding(),
    ),
    GetPage(
      name: Routes.RESET_PASSWORD,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordControllerBinding(),
    ),
    GetPage(
      name: Routes.SELLER_INFORMATION,
      page: () => const SellerInformationScreen(),
      binding: SellerInformationControllerBinding(),
    ),
    GetPage(
      name: Routes.GUIDE_LINE,
      page: () => const GuideLineScreen(),
      binding: GuideLineControllerBinding(),
    ),
    GetPage(
      name: Routes.GENDER_SELECTION,
      page: () => const GenderSelectionScreen(),
      binding: GenderSelectionControllerBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_SELECTION,
      page: () => const ProductSelectionScreen(),
      binding: ProductSelectionControllerBinding(),
    ),
    GetPage(
      name: Routes.CATEGORY_SELECTION,
      page: () => const CategorySelectionScreen(),
      binding: CategorySelectionControllerBinding(),
    ),
    GetPage(
      name: Routes.HOW_DOES_IT_WORKS,
      page: () => const HowDoesItWorksScreen(),
      binding: HowDoesItWorksControllerBinding(),
    ),
    GetPage(
      name: Routes.CATEGORIES,
      page: () => const CategoriesScreen(),
      binding: CategoriesControllerBinding(),
    ),
    GetPage(
      name: Routes.MY_ORDER,
      page: () => const MyOrderScreen(),
      binding: MyOrderControllerBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => const AccountScreen(),
      binding: AccountControllerBinding(),
    ),
  ];
}
