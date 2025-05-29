

import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/modules/map/controllers/map_screen_controller.dart';


class MapScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapScreenController>(() => MapScreenController(),);
  }
}
