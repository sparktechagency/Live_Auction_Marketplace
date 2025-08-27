import 'package:get/get.dart';

import '../../../../presentation/tools/controllers/tools.controller.dart';

class ToolsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToolsController>(
      () => ToolsController(),
    );
  }
}
