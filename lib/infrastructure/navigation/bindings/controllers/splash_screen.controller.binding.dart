import 'package:get/get.dart';

 import '../../../../presentation/auth/splashScreen/controllers/splash_screen.controller.dart';

class SplashScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(
      () => SplashScreenController(),
    );
  }
}
