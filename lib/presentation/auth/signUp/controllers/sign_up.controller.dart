import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:live_auction_marketplace/presentation/auth/successScreen/controllers/success_screen.controller.dart';

import '../../../../infrastructure/navigation/routes.dart';

class SignUpController extends GetxController {
  final SuccessScreenController successScreenController = Get.put(SuccessScreenController());
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'US');


  void navigateToRegistrationSuccess() {

    Get.find<SuccessScreenController>().initializeSuccessScreen(
      title: "Sign up successful",
      subTitle: "Please Check your Email",
      buttonText: "Next",
      onPressed: () {

      },
    );
    Get.toNamed(Routes.SUCCESS_SCREEN);
  }
}
