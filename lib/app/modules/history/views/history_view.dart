import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/helper_functions/date_time_formatter.dart';

import '../../../utils/resources/custom_widgets/reusable_text.dart';
import '../../../utils/resources/other/widget_functions.dart';
import '../../../utils/themes/theme_colors.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));


    return Scaffold(
      body: Column(
        children: [

          ///Appbar and list
          Expanded(
            child: Stack(
              children: [

                Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 2,
                    margin:const EdgeInsets.symmetric(horizontal: 0) ,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(18), bottomLeft: Radius.circular(18)),
                    ),
                    child: Container(
                      height: 193,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(18), bottomLeft: Radius.circular(18)),
                          color: Color(0xFF7065E4)
                      ),
                      child: Column(
                        children: [

                          addVerticalSpace(50),

                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              ///Top heading
                              ReusableText(
                                text: "History",
                                fontSize: 20,
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                ///Listview builder
                Padding(
                  padding: const EdgeInsets.only(top: 150),
                  child: SizedBox(
                    height: double.infinity,

                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (controller.attendanceList.isEmpty) {
                        return const Center(child: Text('No data found.'));
                      }

                      return RefreshIndicator(
                        onRefresh: controller.loadAttendanceHistory,
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: controller.attendanceList.length,
                          itemBuilder: (context, index) {

                            final record = controller.attendanceList[index];

                            return Card(
                              color: AppColors.white,
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Leading Icon
                                    Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Icon(
                                        record.status == 'Present' ? Icons.check_circle : Icons.error,
                                        color: record.status == 'Present' ? Colors.green : Colors.red,
                                        size: 32,
                                      ),
                                    ),

                                    // Main Column
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          addVerticalSpace(8),
                                          ReusableText(text: "Status: ${record.status}", fontWeight: FontWeight.bold, fontSize: 16,),

                                          addVerticalSpace(8),


                                          ReusableText(text: dateTimeFormatter(record.dateTime)),

                                          addVerticalSpace(10),
                                          ReusableText(text: "Latitude: ${record.latitude}"),
                                          ReusableText(text: "Longitude: ${record.longitude}"),
                                          addVerticalSpace(4),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    })
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}







