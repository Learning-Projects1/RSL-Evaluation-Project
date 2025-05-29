import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/modules/attendance/controllers/attendance_controller.dart';


class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(() => AttendanceController(),);
  }
}
