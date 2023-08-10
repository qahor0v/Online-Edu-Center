import 'package:get/get.dart';

class SignUpController extends GetxController {
  var nameChecker = "".obs;
  var lastNameChecker = "".obs;
  var userNameChecker = "".obs;
  var emailChecker = "".obs;
  var passwordChecker = "".obs;
  var passwordRepeatChecker = "".obs;
  var result = true.obs;

  var check = false.obs;
  void changeValue() {
    check.value = !check.value;
  }
}
