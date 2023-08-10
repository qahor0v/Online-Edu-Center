import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:education/src/controller/auth_checker.dart';
import 'package:education/src/repository/exceptions/forbidden_exception.dart';
import 'package:education/src/repository/exceptions/unauthorized_exception.dart';
import 'package:education/src/repository/models/sign_in_model.dart';
import 'package:education/src/repository/network/authentication.dart';
import 'package:education/src/ui/pages/bottom_navbar_view.dart';
import 'package:get/get.dart';

import 'sign_in_validate_service.dart';

class DoSignIn {
  String? userName;
  String? password;
  final authCheckController = Get.put(AuthCheckController());

  DoSignIn({required this.userName, required this.password});

  void signIn() async {
    final loginValidateService =
        SignInValidateService(userName: userName, password: password);

    authCheckController.userNameChecker.value = "";
    authCheckController.passwordChecker.value = "";

    if (loginValidateService.checkForCorrectness() == true) {
      SignInModel model = SignInModel(username: userName, password: password);
      authCheckController.changeValue();

      try {
        await Authenticate.signIn(userName!, password!, model.toJson());
        authCheckController.changeValue();
        Get.to(() => const BottomNavBarView());
      } catch (e) {
        if (e is UnauthorizedException) {
          authCheckController.userNameChecker.value = "Check the username";
          authCheckController.passwordChecker.value = "Check the password";
          log('Unauthorized Error: ${e.message}');
        } else if (e is ForbiddenException) {
          authCheckController.userNameChecker.value =
              "Forbidden: Access denied";
          authCheckController.passwordChecker.value =
              "Forbidden: Access denied";
          log('Forbidden Error: ${e.message}');
        } else if (e is DioException) {
          authCheckController.userNameChecker.value = "Check the username";
          authCheckController.passwordChecker.value = "Check the password";
          log('DioError: ${e.message}');
        }
      }
    }
  }
}
