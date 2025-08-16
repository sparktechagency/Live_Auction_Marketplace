import 'package:get/get.dart';

import '../../../../../infrastructure/navigation/routes.dart';
import '../../../../infrastructure/utils/secure_storage_helper.dart';

class SplashScreenController extends GetxController {

 void startSplashTimer(){
   Future.delayed(Duration(seconds: 3),() async {
     String role = await SecureStorageHelper.getString("userRole");

    if(role.isNotEmpty){
      Get.offAllNamed(Routes.HOME);
      //Get.offAllNamed(Routes.ROLE_SELECTION);
    }else{
      Get.offAllNamed(Routes.ROLE_SELECTION);
    }

   });
 }
}
