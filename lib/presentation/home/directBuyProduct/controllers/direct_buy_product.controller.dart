import 'package:get/get.dart';

class DirectBuyProductController extends GetxController {
   RxBool stripeSelected= false.obs;
   RxBool googlePaySelected= false.obs;

   Future <void> selectStripe() async{
     stripeSelected.value=true;
     googlePaySelected.value=false;
   }
   Future <void> selectGooglePay() async{
     googlePaySelected.value=true;
     stripeSelected.value=false;
   }
}
