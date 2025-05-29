

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/modules/map/controllers/map_screen_controller.dart';



class MapScreenView extends GetView<MapScreenController> {
   const MapScreenView({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    ///Todo:Remove these from here this is just for testing
    final LatLng officeLocation = LatLng(25.2048, 55.2708);
    final double radiusInMeters = 100;

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: officeLocation,
          zoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: '',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: officeLocation,
                width: 40,
                height: 40,
                child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: officeLocation,
                color: Colors.blue.withOpacity(0.2),
                borderStrokeWidth: 2,
                borderColor: Colors.blue,
                radius: radiusInMeters,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
