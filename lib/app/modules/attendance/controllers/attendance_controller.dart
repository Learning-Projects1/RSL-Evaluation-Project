import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/helper_functions/app_preferences.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/other/FlushBar.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/other/constants.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/other/preferences_keys.dart';

import '../../../core/hive_models/attendance_model.dart';
import '../../../utils/resources/custom_widgets/loading_dialog.dart';

class AttendanceController extends GetxController {

  Position? currentPosition;
  double targetLat = 0.0;
  double targetLng = 0.0;
  double distanceInMeters = 0.0;


  Future<void> onMarkAttendanceClicked() async {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoadingDialog(true);
    });

    await getCurrentLocation();

    await getAssignedLocation();

    await calculateDistanceAndMarkAttendance();


  }



  /// Getting current location
  Future<void> getCurrentLocation() async {
    try{


      ///Checking if location services are enabled
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        FlushBars.error("Location services are disabled.");
      }

      ///Checking and requesting permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {

        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          FlushBars.error("Location permission denied.");
        }

      }

      if (permission == LocationPermission.deniedForever) {
        FlushBars.error("Location permissions are permanently denied.");
      }



      /// Getting current location
      currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      debugPrint("Current Location: ${currentPosition?.latitude}, ${currentPosition?.longitude}");


    }catch(e){
      debugPrint('Current position error: $e');
    }
  }

  ///Getting assigned location from file
  Future<void> getAssignedLocation() async {
    try{
      /// Loading predefined location from file for current user
      final String usersData = await rootBundle.loadString('assets/data/user_data.json');
      final data = json.decode(usersData);

      final List usersList = data['users'];

      var userEmail = await AppPreferences.getPrefString(PreferenceKeys.userEmail);

      final matchedUser = usersList.firstWhere(
            (user) =>
        user['email'] == userEmail,
        orElse: () => null,
      );

      targetLat = matchedUser['latitude'];
      targetLng = matchedUser['longitude'];

      debugPrint("Assigned Location: $targetLat, $targetLng");

    }catch(e){
      debugPrint('Assigned Location position error: $e');
    }
  }


  /// Calculating distance and marking attendance
  Future<void> calculateDistanceAndMarkAttendance() async {
    try{

      ///Calculating distance
      distanceInMeters = Geolocator.distanceBetween(
        currentPosition!.latitude,
        currentPosition!.longitude,
        targetLat,
        targetLng,
      );

      ///Closing loading dialog
      Get.back();

      debugPrint("Distance: $distanceInMeters");

      /// Marking attendance if within 100 meters
      if (distanceInMeters <= 100) {

        await saveAttendance(status : Constants.present);

        FlushBars.success("Attendance marked successfully");
      } else {
        await saveAttendance(status : Constants.outsideArea);
        FlushBars.error("You are not at your assigned location.");
      }

    }catch(e){
      debugPrint('Distance calculation error: $e');

      ///Closing loading dialog
      Get.back();

      FlushBars.error("An error occurred while calculating distance.");
    }
  }

  ///Saving attendance to Hive
  Future<void> saveAttendance({required String status}) async {

    final userEmail = await AppPreferences.getPrefString(PreferenceKeys.userEmail);

    final attendance = AttendanceModel(
      dateTime: DateTime.now().toString(),
      latitude: currentPosition?.latitude.toString() ?? "",
      longitude: currentPosition?.longitude.toString() ?? "",
      status: distanceInMeters <= 100 ? Constants.present : Constants.outsideArea,
      email: userEmail,
    );


    final box = Hive.box<AttendanceModel>('attendanceBox');

    await box.add(attendance);
  }





}


