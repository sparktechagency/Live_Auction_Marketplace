import 'package:get/get.dart';
import 'package:live_auction_marketplace/presentation/home/controllers/home.controller.dart';

import '../../../../presentation/main_app/controllers/main_app.controller.dart';

class MainAppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainAppController>(
      () => MainAppController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

  }
}