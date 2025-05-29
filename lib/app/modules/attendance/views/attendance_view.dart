import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
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
                  margin:EdgeInsets.symmetric(horizontal: 0) ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(18), bottomLeft: Radius.circular(18)),
                  ),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
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
                                  controller.logoutUser();
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
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: ReusableText(
                                          text: "Logout",
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      )
                                  ),
                                ),
                              ),
                            ),


                            ///Attendance text
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

          Column(
            children: [

              ReusableButton(onPressed: (){

              }, labelText: "Mark Attendance")

            ],
          )

        ],
      ),
    );
  }
}
