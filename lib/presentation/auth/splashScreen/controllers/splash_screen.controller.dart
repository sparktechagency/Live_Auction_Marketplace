import 'package:get/get.dart';

import '../../../../../infrastructure/navigation/routes.dart';
import '../../../../infrastructure/utils/secure_storage_helper.dart';
import '../../../shared/widgets/customButtomNavigation/customButtomNavigationBar.dart';

class SplashScreenController extends GetxController {

 void startSplashTimer(){
   Future.delayed(Duration(seconds: 3),() async {
     String role = await SecureStorageHelper.getString("userRole");

    if(role.isNotEmpty){
      Get.offAllNamed(Routes.MAIN_APP);
      //Get.offAllNamed(Routes.ROLE_SELECTION);

    }else{
      Get.offAllNamed(Routes.ROLE_SELECTION);
    }

   });
 }
}
