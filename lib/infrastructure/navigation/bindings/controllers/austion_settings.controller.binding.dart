import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/scheduleActionSettings/austionSettings/controllers/austion_settings.controller.dart';

class AustionSettingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AustionSettingsController>(
      () => AustionSettingsController(),
    );
  }
}
