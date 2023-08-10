import 'package:education/service/sign_up_validate_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/user_model.dart';
import '../data/network/authentication.dart';
import '../getx_controllers/sign_up_controller.dart';
import 'dialog_service.dart';

class DoSignUp {
  String? name;
  String? lastName;
  String? username;
  String? email;
  String? password;
  String? passwordRepeat;
  SignUpController signUpController = Get.put(SignUpController());

  DoSignUp({
    required this.name,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.passwordRepeat,
  });

  Future<void> signUp(BuildContext context) async {
    SignUpValidateService signUpValidateService = SignUpValidateService(
        name: name,
        lastName: lastName,
        userName: username,
        email: email,
        password: password,
        passwordRepeat: passwordRepeat);

    signUpController.nameChecker.value = "";
    signUpController.lastNameChecker.value = "";
    signUpController.userNameChecker.value = "";
    signUpController.emailChecker.value = "";
    signUpController.passwordChecker.value = "";
    signUpController.passwordRepeatChecker.value = "";

    if (signUpValidateService.checkForCorrectness() == true) {
      UserModel um = UserModel(
        name: name,
        lastName: lastName,
        username: username,
        email: email,
        password: password,
      );
      signUpController.changeValue();

      var statusCode = Authenticate.signUp(
          name!, lastName!, username!, email!, password!, um.toJson());
      if (await statusCode == 202 || await statusCode == 201) {
        signUpController.changeValue();
        DialogService.showDialog(context, "Verification",
            "We have send verification message to $email. Please enter your email and verify it");
      }
    }
  }
}
