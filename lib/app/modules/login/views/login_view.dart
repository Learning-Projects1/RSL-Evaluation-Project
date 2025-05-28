import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/routes/app_pages.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/custom_widgets/reusable_button.dart';

import '../../../utils/resources/app_images.dart';
import '../../../utils/resources/app_size_config.dart';
import '../../../utils/resources/custom_widgets/reusable_text.dart';
import '../../../utils/resources/custom_widgets/reusable_text_form_field.dart';
import '../../../utils/resources/widget_functions.dart';
import '../../../utils/themes/theme_colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: SizeConfig.blockSizeVertical * 33,
                child: Stack(
                  children: [

                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                        child: Image.asset(
                          AppImages.loginTopBackground,
                          width: SizeConfig.blockSizeHorizontal * 100,
                          height: SizeConfig.blockSizeVertical * 25,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),


                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Image.asset(/*AppImages.rslLogo*/"assets/png_jpg_images/rsl_logo.jpg",
                          width: SizeConfig.blockSizeHorizontal * 30,
                          height: SizeConfig.blockSizeHorizontal *
                              30,),
                      ),
                    )
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [

                    addVerticalSpace(70),


                    const ReusableTextFormField(
                      hintText: "Email",
                      inputType: TextInputType.emailAddress,
                      filled: true,
                      filledColor: AppColors.grey200,
                      maxLength: 30,
                    ),


                    addVerticalSpace(16),


                    const ReusableTextFormField(
                      hintText: "Password",
                      inputType: TextInputType.text,
                      filled: true,
                      isObscure: true,
                      filledColor: AppColors.grey200,
                      maxLength: 30,
                    ),

                    addVerticalSpace(12),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReusableText(
                          text: "Forgot the password ?",
                          color: AppColors.darkPurple,
                        )
                      ],
                    ),


                    addVerticalSpace(34),

                    ///Login button
                    ReusableButton(onPressed: () {
                      // Get.toNamed(Routes.LOGIN);
                    }, labelText: "Login"),


                  ],
                ),
              ),


              addVerticalSpace(22),

            ],
          ),
        ),
      ),
    );
  }
}
