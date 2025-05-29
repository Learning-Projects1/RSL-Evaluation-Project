import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/theme_colors.dart';

class FlushBars {

  static void error(String message, {BuildContext? context, int? duration}){

    showFlushbar(context: Get.context! ,
      flushbar: Flushbar(

        forwardAnimationCurve:Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: Duration(seconds: duration ?? 2),
        animationDuration: const Duration(milliseconds: 400),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: AppColors.primaryRed,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.error , size: 28 , color: Colors.white,),
      )..show(Get.context! ),

    );

  }




  static void success( String message, {BuildContext? context, int? duration}){

    showFlushbar(context: Get.context! ,
      flushbar: Flushbar(
        forwardAnimationCurve:Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: Duration(milliseconds: duration ?? 1500),
        borderRadius: BorderRadius.circular(8),
        animationDuration: const Duration(milliseconds: 300),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.check_circle_rounded, size: 28 , color: Colors.white,),
      )..show(Get.context!),

    );

  }




  static void flushBarProcessMessage(String message, BuildContext context){

    showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve:Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(milliseconds: 500),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.blue,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(Icons.preview, size: 28 , color: Colors.white,),
      )..show(context),

    );

  }

  static snackBar(String message){
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.primaryRed,
            content: Text(message ))
    );
  }

}