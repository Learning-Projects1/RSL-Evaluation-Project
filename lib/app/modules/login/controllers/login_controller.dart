import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rls_evaluation_project_supervisor_attendance_app/app/utils/resources/other/FlushBar.dart';

import '../../../core/global_models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/resources/helper_functions/hash_password.dart';
import '../../../utils/resources/helper_functions/app_preferences.dart';
import '../../../utils/resources/other/preferences_keys.dart';

class LoginController extends GetxController {


  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscurePassword = true.obs;


  void onLoginClicked() {

    if(emailController.text.isEmpty){
      FlushBars.error('Please enter your email');

    }

    ///Checking if email is valid or not
    else if(!GetUtils.isEmail(emailController.text.toString().trim())){
      FlushBars.error('Please enter a valid email');

    }

    else if(passwordController.text.isEmpty){
      FlushBars.error('Please enter your password');

    } else{
      validateLogin();
    }

  }


  ///Validating login
  Future<void> validateLogin() async {
    final String usersData = await rootBundle.loadString('assets/data/user_data.json');
    final data = json.decode(usersData);

    final List usersList = data['users'];

    final enteredEmail = emailController.text.trim();
    final enteredPassword = passwordController.text.trim();

    ///Getting hashed password from hash_password.dart file
    final hashedInput = hashPassword(enteredPassword);

    debugPrint('Hashed Input: $hashedInput');

    final matchedUser = usersList.firstWhere(
          (user) =>
      user['email'] == enteredEmail &&
          user['hashedPassword'] == hashedInput,
      orElse: () => null,
    );

    if (matchedUser != null) {

      final user = UserGlobalModel.fromJson(matchedUser);

      await saveUserSession(user);

      Get.offAllNamed(Routes.MAIN);

    } else {
      Get.snackbar('Login Failed', 'Incorrect email or password');
    }
  }


  ///Saving user session in shared preferences
  saveUserSession(UserGlobalModel user) {

    AppPreferences.setPrefString(PreferenceKeys.userEmail, user.email);
    AppPreferences.setPrefString(PreferenceKeys.name, user.name);
    AppPreferences.setPrefBoolean(PreferenceKeys.isUserLoggedIn, true);

  }




}
