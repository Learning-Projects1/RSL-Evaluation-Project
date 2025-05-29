import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/routes/app_pages.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/custom_widgets/reusable_button.dart';

import '../../../utils/resources/other/app_images.dart';
import '../../../utils/resources/custom_widgets/reusable_text.dart';
import '../../../utils/resources/custom_widgets/reusable_text_form_field.dart';
import '../../../utils/resources/other/app_size_config.dart';
import '../../../utils/resources/other/widget_functions.dart';
import '../../../utils/themes/theme_colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));

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


                    /// Logo
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Match card radius
                          child: Image.asset(
                            AppImages.rslLogo,
                            width: SizeConfig.blockSizeHorizontal * 30,
                            height: SizeConfig.blockSizeHorizontal * 30,
                            fit: BoxFit.cover,
                          ),
                        ),
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


                    ReusableTextFormField(
                      hintText: "Email",
                      inputType: TextInputType.emailAddress,
                      filled: true,
                      filledColor: AppColors.grey200,
                      controller: controller.emailController,
                      maxLength: 30,
                    ),


                    addVerticalSpace(16),


                    Obx(
                        ()=> ReusableTextFormField(
                        hintText: "Password",
                        inputType: TextInputType.text,
                        filled: true,
                        isObscure: controller.obscurePassword.value,
                        controller: controller.passwordController,
                        filledColor: AppColors.grey200,
                        suffixIcon: GestureDetector(
                            onTap: (){
                              controller.obscurePassword.value = !controller.obscurePassword.value;
                            },
                            child : controller.obscurePassword.value == true ? const Icon(Icons.visibility, color: AppColors.grey400) :
                            Icon(Icons.visibility, color: AppColors.primaryBlue)
                        ),
                        maxLength: 30,
                      ),
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
                      controller.onLoginClicked();
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
