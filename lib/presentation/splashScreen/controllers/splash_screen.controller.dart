import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';

class SplashScreenController extends GetxController {
 void startSplashTimer(){
   Future.delayed(Duration(seconds: 3),(){
     Get.toNamed(Routes.HOME);
   });
 }
}
