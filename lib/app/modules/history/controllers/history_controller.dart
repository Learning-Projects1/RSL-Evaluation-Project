import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/helper_functions/app_preferences.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/other/preferences_keys.dart';

import '../../../core/hive_models/attendance_model.dart';
import '../../../utils/resources/other/FlushBar.dart';

class HistoryController extends GetxController {


  RxList<AttendanceModel> attendanceList = <AttendanceModel>[].obs;
  RxBool isLoading = true.obs;

  late Box attendanceBox;


  @override
  Future<void> onInit() async {
    super.onInit();
    await openBox();
    loadAttendanceHistory();
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    attendanceBox = await Hive.openBox('attendanceBox');
    return;
  }

  ///Loading user attendance history for current user
  Future<void> loadAttendanceHistory() async {
    isLoading.value = true;

    var userEmail = await AppPreferences.getPrefString(PreferenceKeys.userEmail);

    await Future.delayed(const Duration(milliseconds: 500));
    attendanceList.value = attendanceBox.values
        .cast<AttendanceModel>()
        .where((record) => record.email == userEmail)
        .toList()
        .reversed
        .toList();
    isLoading.value = false;
  }

}
