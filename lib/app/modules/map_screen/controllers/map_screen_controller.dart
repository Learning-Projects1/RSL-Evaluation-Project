import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../utils/resources/helper_functions/app_preferences.dart';
import '../../../utils/resources/other/FlushBar.dart';
import '../../../utils/resources/other/preferences_keys.dart';

class MapScreenController extends GetxController {
  final Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  final Rx<LatLng?> assignedLocation = Rx<LatLng?>(null);
  final double radiusInMeters = 100;

  final RxDouble currentZoom = 15.0.obs;

  final double baseRadius = 100; // in meters
  final double baseZoom = 15;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    getAssignedLocation();
  }


  double get scaledRadius {
    /// Adjusting visual size by zoom
    return baseRadius * pow(2, currentZoom.value - baseZoom);
  }


  Future<void> getCurrentLocation() async {
    final hasPermission = await checkAndGetLocationPermissions();
    if (!hasPermission) return;

    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentLocation.value = LatLng(position.latitude, position.longitude);
    } catch (e) {
      FlushBars.error("Failed to get current location.");
    }
  }

  Future<void> getAssignedLocation() async {
    try {
      final String usersData = await rootBundle.loadString('assets/data/user_data.json');
      final data = json.decode(usersData);

      final List usersList = data['users'];
      var userEmail = await AppPreferences.getPrefString(PreferenceKeys.userEmail);

      final matchedUser = usersList.firstWhere(
            (user) => user['email'] == userEmail,
        orElse: () => null,
      );

      if (matchedUser != null) {
        assignedLocation.value = LatLng(
          matchedUser['latitude'],
          matchedUser['longitude'],
        );
        debugPrint("Assigned Location: ${assignedLocation.value}");
      } else {
        debugPrint("No matching user found.");
      }
    } catch (e) {
      debugPrint('Assigned Location error: $e');
    }
  }

  Future<bool> checkAndGetLocationPermissions() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        FlushBars.error("Location services are disabled.");
        return false;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          FlushBars.error("Location permission denied.");
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        FlushBars.error("Location permissions are permanently denied. Please enable them from settings.");
        return false;
      }

      return true;
    } catch (e) {
      FlushBars.error("An error occurred while checking location permissions.");
      return false;
    }
  }
}

