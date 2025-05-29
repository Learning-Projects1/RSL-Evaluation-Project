import 'package:get/get.dart';

class MainController extends GetxController {


  var bottomNavSelectedIndex = 0.obs;

  void onChangeTab(int index) {
    bottomNavSelectedIndex.value = index;
  }


}
