import 'package:get/get.dart';

import '../../../../presentation/auth/forgetPassword/verifyEmail/controllers/verify_email.controller.dart';
import '../../../../presentation/auth/logIn/controllers/log_in.controller.dart';

class LogInControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInController>(
      () => LogInController(),
    );
    Get.lazyPut<VerifyEmailController>(
          () => VerifyEmailController(),
    );
  }
}
