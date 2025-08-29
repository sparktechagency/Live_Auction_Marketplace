import 'package:get/get.dart';

import '../../../../presentation/bothAccountScreens/walletSection/addPaymentMethode/controllers/add_payment_methode.controller.dart';
import '../../../../presentation/bothAccountScreens/walletSection/myWallet/controllers/my_wallet.controller.dart';

class AddPaymentMethodeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPaymentMethodeController>(
      () => AddPaymentMethodeController(),
    );    Get.lazyPut<MyWalletController>(
      () => MyWalletController(),
    );
  }
}
