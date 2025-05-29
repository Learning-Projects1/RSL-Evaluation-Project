import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/other/preferences_keys.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/resources/helper_functions/app_preferences.dart';

class SplashController extends GetxController {


  @override
  void onInit() {
    loadPreferences();
    super.onInit();
  }

  Future<void> loadPreferences() async {

    bool isUserLoggedIn = await AppPreferences.getPrefBoolean(PreferenceKeys.isUserLoggedIn);

    Future.delayed(const Duration(seconds: 2), () async {
      if(isUserLoggedIn){
        Get.offAllNamed(Routes.MAIN);
      }else{
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }


}
