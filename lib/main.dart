import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/routes/app_pages.dart';

import 'app/core/hive_models/attendance_model.dart';
import 'app/utils/resources/other/app_size_config.dart';
import 'app/utils/themes/theme_colors.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox<AttendanceModel>('attendanceBox');
  registerHiveAdapters();

  // Screen rotation disabled
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp( const MyApp());
}

void registerHiveAdapters() {
  Hive.registerAdapter(AttendanceModelAdapter());
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