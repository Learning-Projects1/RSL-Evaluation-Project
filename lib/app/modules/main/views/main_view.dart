import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/modules/attendance/views/attendance_view.dart';

import '../../../utils/resources/other/app_fonts.dart';
import '../../../utils/themes/theme_colors.dart';
import '../../history/views/history_view.dart';
import '../../map/views/map_screen_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
   const MainView({super.key});


  final List<Widget> _screens = const [
    AttendanceView(),
    HistoryView(),
    MapScreenView(),
  ];


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(

        body: _screens[controller.bottomNavSelectedIndex.value],

        bottomNavigationBar: ClipRRect(

          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),


          child: BottomNavigationBar(

          backgroundColor: AppColors.grey300,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.darkPurple,
          unselectedItemColor: Colors.black.withOpacity(0.5),
          currentIndex: controller.bottomNavSelectedIndex.value,
          onTap: controller.onChangeTab,
          elevation: 0,
          unselectedLabelStyle: const TextStyle(fontFamily: AppFonts.ceraPro),
          selectedLabelStyle:const TextStyle(fontFamily: AppFonts.ceraPro) ,


          items:  const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'Attendance',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),

          ],

            ),
        ));
    });
  }
}


