import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:get/get.dart';

import '../controllers/map_screen_controller.dart';

class MapScreenView extends GetView<MapScreenController> {
  const MapScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final currentLoc = controller.currentLocation.value;
        final assignedLoc = controller.assignedLocation.value;

        if (currentLoc == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return FlutterMap(
          options: MapOptions(
            center: currentLoc,
            zoom: controller.currentZoom.value,
            onPositionChanged: (position, hasGesture) {
              if (position.zoom != null) {
                controller.currentZoom.value = position.zoom!;
              }
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: '',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: currentLoc,
                  width: 40,
                  height: 40,
                  child: const Icon(Icons.my_location, color: Colors.red, size: 40),
                ),
              ],
            ),
            if (assignedLoc != null)
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: assignedLoc,
                    color: Colors.blue.withOpacity(0.2),
                    borderStrokeWidth: 2,
                    borderColor: Colors.blue,
                    radius: controller.scaledRadius, // <- scaled with zoom
                  ),
                ],
              ),
          ],
        );
      }),
    );
  }

}
