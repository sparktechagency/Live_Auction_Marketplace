import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/Account/controllers/account.controller.dart';


class AccountControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
