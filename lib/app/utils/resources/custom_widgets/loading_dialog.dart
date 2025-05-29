import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/custom_widgets/reusable_text.dart';

import '../other/app_size_config.dart';
import '../other/widget_functions.dart';


void showLoadingDialog( bool? showLoading) {

  SizeConfig().init(Get.context!);

  if(showLoading == true){
    showGeneralDialog(
      context: Get.context!,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return WillPopScope(
            onWillPop: () async => false,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.safeBlockHorizontal * 30,
                      height: SizeConfig.safeBlockHorizontal * 30,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CupertinoActivityIndicator(color: Colors.white,radius: 16,),
                          addVerticalSpace(10),
                          const Material(color: Colors.transparent,child: ReusableText(text: 'Loading...',color: Colors.white,fontWeight: FontWeight.bold,))
                        ],
                      )
                  ),
                ],
              ),
            )
        );
      },

      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }else{
    Get.back();
  }


}