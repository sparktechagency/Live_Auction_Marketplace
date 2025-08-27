import 'package:get/get.dart';

import '../../../../presentation/sellScreen/controllers/sell_screen.controller.dart';

class SellScreenControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SellScreenController>(
      () => SellScreenController(),
    );
  }
}
