import 'package:get/get.dart';

class AustionSettingsController extends GetxController {
  List<Map<String, dynamic>> timeSelection = [
    {'buttonName': '5 Sec'},
    {'buttonName': '7 Sec'},
    {'buttonName': '10 Sec'},
  ];
RxInt timeSelectionIndex = 0.obs;

RxBool active = false.obs;


  void onTimeSelection(int index){
    timeSelectionIndex.value=index;
  }
}
