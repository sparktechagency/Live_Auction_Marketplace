import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/settings/allPrivacyAndTearms/controllers/all_privacy_and_tearms.controller.dart';

class AllPrivacyAndTearmsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPrivacyAndTearmsController>(
      () => AllPrivacyAndTearmsController(),
    );
  }
}
