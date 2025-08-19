import 'package:get/get.dart';

import '../../../../presentation/myOrder/controllers/my_order.controller.dart';

class MyOrderControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyOrderController>(
      () => MyOrderController(),
    );
  }
}
