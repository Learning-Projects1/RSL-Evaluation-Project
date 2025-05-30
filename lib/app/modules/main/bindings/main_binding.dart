import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/modules/history/controllers/history_controller.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/modules/map_screen/controllers/map_screen_controller.dart';

import '../../attendance/controllers/attendance_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(),);
    Get.lazyPut<AttendanceController>(() => AttendanceController(),);
    Get.lazyPut<HistoryController>(() => HistoryController(),);
    Get.lazyPut<MapScreenController>(() => MapScreenController(),);
  }
}
