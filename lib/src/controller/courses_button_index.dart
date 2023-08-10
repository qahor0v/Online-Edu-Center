import 'package:get/get.dart';

class CoursesButtonIndexController extends GetxController {
  var buttonIndex = 1.obs;

  void changeValue(int index) {
    buttonIndex.value = index;
  }
}
