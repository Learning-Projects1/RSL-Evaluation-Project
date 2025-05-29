import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../utils/resources/other/app_images.dart';
import '../../../utils/resources/other/app_size_config.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    controller.onInit();

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Image.asset(
          AppImages.rslLogo,
          width: SizeConfig.blockSizeHorizontal * 50,
          height: SizeConfig.blockSizeHorizontal * 50,
        ),
      ),
    );
  }
}
