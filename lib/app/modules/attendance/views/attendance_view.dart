import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/custom_widgets/reusable_button.dart';

import '../../../utils/resources/custom_widgets/reusable_text.dart';
import '../../../utils/resources/other/widget_functions.dart';
import '../../../utils/themes/theme_colors.dart';
import '../controllers/attendance_controller.dart';

class AttendanceView extends GetView<AttendanceController> {
  const AttendanceView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.light));


    return Scaffold(
      body: Column(
        children: [

          ///Custom Appbar and widgets
          Stack(
            children:  [
              Align(
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 2,
                  margin:const EdgeInsets.symmetric(horizontal: 0) ,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(18), bottomLeft: Radius.circular(18)),
                  ),
                  child: Container(
                    height: 120,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(18), bottomLeft: Radius.circular(18)),
                        color: Color(0xFF7065E4)
                    ),
                    child: Column(
                      children: [

                        addVerticalSpace(50),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [

                            ///LogOut
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: (){
                                  showLogoutDialog();
                                },
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Container(
                                      width: 72,
                                      height: 42,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Center(
                                        child: ReusableText(
                                          text: "Logout",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryBlack,
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            ),


                            ///Attendance heading
                            const ReusableText(
                              text: "Attendance",
                              fontSize: 20,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),

                            const SizedBox(width: 105,)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(24),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ///User name
                      Obx(() => ReusableText(
                        text: "Welcome, ${controller.userName.value}",
                        fontSize: 20,
                        color: AppColors.primaryGreen,
                        fontWeight: FontWeight.bold,
                      )),

                      addVerticalSpace(24),

                      ///Live date time
                      Obx(() {
                        final formattedTime = DateFormat('dd MMM yyyy – hh:mm:ss a')
                            .format(controller.currentTime.value);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ReusableText(
                              text: formattedTime,
                              fontSize: 16,
                              color: AppColors.lightPurple,
                            ),
                          ],
                        );
                      }),


                    ],
                  ),
                ),
                addVerticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ReusableButton(
                      wrapWidth: true,
                      onPressed: () {
                        controller.onMarkAttendanceClicked();
                      },
                      labelText: "Mark Attendance",
                    ),
                  ],
                ),
              ],
            ),
          )


        ],
      ),
    );
  }


  ///Getting confirmation for logging out
  void showLogoutDialog() {
    showCupertinoDialog(
      context: Get.context!,
      builder: (_) => CupertinoAlertDialog(
        title: const ReusableText(text: "Confirm Logout", fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue,),
        content: const ReusableText(text:"Are you sure you want to log out?"),
        actions: [
          CupertinoDialogAction(
            child: const ReusableText(text:"Cancel", color: Colors.blue,fontWeight: FontWeight.bold,),
            onPressed: () => Get.back(),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const ReusableText(text:"Logout", color: AppColors.primaryRed, fontWeight: FontWeight.bold,),
            onPressed: () {
              Get.back();
              Get.find<AttendanceController>().logoutUser();
            },
          ),
        ],
      ),
    );
  }

}
