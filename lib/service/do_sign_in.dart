import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../data/exceptions/forbidden_exception.dart';
import '../data/exceptions/unauthorized_exception.dart';
import '../data/models/sign_in_model.dart';
import '../data/network/authentication.dart';
import '../getx_controllers/auth_checker.dart';
import '../pages/bottom_navbar_view.dart';
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
        Get.to(() => BottomNavBarView());
      } catch (e) {
        if (e is UnauthorizedException) {
          authCheckController.userNameChecker.value = "Check the username";
          authCheckController.passwordChecker.value = "Check the password";
          print('Unauthorized Error: ${e.message}');
        } else if (e is ForbiddenException) {
          authCheckController.userNameChecker.value =
              "Forbidden: Access denied";
          authCheckController.passwordChecker.value =
              "Forbidden: Access denied";
          print('Forbidden Error: ${e.message}');
        } else if (e is DioException) {
          authCheckController.userNameChecker.value = "Check the username";
          authCheckController.passwordChecker.value = "Check the password";
          print('DioError: ${e.message}');
        }
      }
    }
  }
}
