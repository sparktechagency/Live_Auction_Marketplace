import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/settings/allPrivacyAndTearms/controllers/all_privacy_and_tearms.controller.dart';
import '../../../../presentation/bothAccountScreens/settings/mainSettings/controllers/settings.controller.dart';


class SettingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.lazyPut<AllPrivacyAndTearmsController>(
      () => AllPrivacyAndTearmsController(),
    );
  }
}
