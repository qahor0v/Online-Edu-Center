import 'package:get/get.dart';

class AuthCheckController extends GetxController {
  var userNameChecker = "".obs;
  var passwordChecker = "".obs;
  var result = true.obs;
  var check = false.obs;

  void changeValue() {
    check.value = !check.value;
  }

}
