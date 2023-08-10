import 'package:get/get.dart';
import '../getx_controllers/auth_checker.dart';

class SignInValidateService {
  String? userName;
  String? password;
  bool result = true;

  final authCheckController = Get.put(AuthCheckController());

  SignInValidateService({required this.userName, required this.password});

  checkForCorrectness() {
    if (userName!.isEmpty) {
      authCheckController.userNameChecker.value = "Username is empty";
      authCheckController.result.value = false;
      result = authCheckController.result.value;
    }
    if (password!.isEmpty) {
      authCheckController.passwordChecker.value = "Password is empty";
      authCheckController.result.value = false;
      result = authCheckController.result.value;
    }
    return result;
  }
}
