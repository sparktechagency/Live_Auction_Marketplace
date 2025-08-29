import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/Account/controllers/account.controller.dart';
import '../../../../presentation/categories/controllers/categories.controller.dart';
import '../../../../presentation/home/homeScreen/controllers/home.controller.dart';
import '../../../../presentation/main_app/controllers/main_app.controller.dart';
import '../../../../presentation/myOrder/controllers/my_order.controller.dart';

class MainAppControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainAppController>(
      () => MainAppController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoriesController>(
      () => CategoriesController(),
    );
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
    Get.lazyPut<MyOrderController>(
      () => MyOrderController(),
    );

  }
}