import 'package:get/get.dart';

class VisibleController extends GetxController {
  var isVisible = true.obs;

  void changeVisibility() {
    isVisible.value = !isVisible.value;
  }
}