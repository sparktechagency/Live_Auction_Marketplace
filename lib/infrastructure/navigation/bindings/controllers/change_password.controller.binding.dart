import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/settings/changePassword/controllers/change_password.controller.dart';

class ChangePasswordControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordController>(
      () => ChangePasswordController(),
    );
  }
}
