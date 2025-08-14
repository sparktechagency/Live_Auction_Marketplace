import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/theme/app_colors.dart';
import 'package:live_auction_marketplace/infrastructure/utils/log_helper.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/utils/secure_storage_helper.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final RxString role = ''.obs;
  final RxString userToken = ''.obs;
  final RxBool isLoggedIn = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    role.value = await SecureStorageHelper.getString("userRole");
    LoggerHelper.info(role.value);
  }

  // Methods to update variables
  void setRole(String newRole) {
    role.value = newRole;
  }

  void setUserToken(String token) {
    userToken.value = token;
  }

  void setLoginStatus(bool status) {
    isLoggedIn.value = status;
  }
}

void main() async {
  var initialRoute = await Routes.initialRoute;

  // Initialize the global controller
  Get.put(AppController(), permanent: true);

  runApp(Phoenix(child: Main(initialRoute)));
}

class Main extends StatelessWidget {
  final String initialRoute;

  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(376, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          getPages: Nav.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.neutral950,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.neutral950,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
            indicatorColor: AppColors.primary1000
          ),
        );
      },
    );
  }
}
