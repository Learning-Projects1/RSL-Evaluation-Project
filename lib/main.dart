import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/routes/app_pages.dart';

import 'app/utils/resources/app_size_config.dart';
import 'app/utils/themes/theme_colors.dart';

void main() {


  runApp( const MyApp());

  //screen rotation disabled
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);


    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Supervisor Attendance App",
      theme: AppColors().themeData,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}