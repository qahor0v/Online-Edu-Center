import 'package:get/get.dart';
import '../getx_controllers/sign_up_controller.dart';

class SignUpValidateService {
  String? name;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  String? passwordRepeat;
  bool result = true;
  SignUpController signUpController = Get.put(SignUpController());

  SignUpValidateService({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.password,
    required this.passwordRepeat,
  });

  checkForCorrectness() {
    if (name!.isEmpty) {
      signUpController.nameChecker.value = "Name is empty";
      signUpController.result.value = false;
      result = signUpController.result.value;
    }
    if (lastName!.isEmpty) {
      signUpController.lastNameChecker.value = "Last name is empty";
      signUpController.result.value = false;
      result = signUpController.result.value;
    }
    if (userName!.isEmpty) {
      signUpController.userNameChecker.value = "Username is empty";
      signUpController.result.value = false;
      result = signUpController.result.value;
    }
    if (email!.isEmpty) {
      signUpController.emailChecker.value = "Email is empty";
      signUpController.result.value = false;
      result = signUpController.result.value;
    }
    if (password!.isEmpty) {
      signUpController.passwordChecker.value = "Password is empty";
      signUpController.result.value = false;
      result = signUpController.result.value;
    }
    if (passwordRepeat!.isEmpty) {
      signUpController.passwordRepeatChecker.value = "Password repeat is empty";
      signUpController.result.value = false;
      result = signUpController.result.value;
    }

    return result;
  }
}
