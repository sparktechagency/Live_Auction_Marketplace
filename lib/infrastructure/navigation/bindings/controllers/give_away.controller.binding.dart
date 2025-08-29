import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/giveAway/giveAway/controllers/give_away.controller.dart';

class GiveAwayControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiveAwayController>(
      () => GiveAwayController(),
    );
  }
}
