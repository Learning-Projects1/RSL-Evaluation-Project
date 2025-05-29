import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/custom_widgets/reusable_button.dart';

import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      

      body: SafeArea(
        child: Column(
          children: [
            
            ReusableButton(onPressed: (){
              controller.onMarkAttendanceClicked();
            }, labelText: "Mark Attendance")
            

          ],
        ),
      )
    );


  }
}
