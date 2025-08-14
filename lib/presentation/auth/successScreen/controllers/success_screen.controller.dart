import 'dart:ui';

import 'package:get/get.dart';

class SuccessScreenController extends GetxController {
 RxString title = "".obs;
 RxString subTitle = "".obs;
 RxString buttonText = "Next".obs;
 VoidCallback? onPressed;


 void initializeSuccessScreen({
  required String title,
  required String subTitle,
  required VoidCallback onPressed,
  String buttonText = "Next",
 }) {
  this.title.value = title;
  this.subTitle.value = subTitle;
  this.onPressed = onPressed;
  this.buttonText.value = buttonText;
 }

 void handleButtonPress() {
  if (onPressed != null) {
   onPressed!();
  }
 }
}