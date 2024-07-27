import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var shouldCloseApp = false.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void setShouldCloseApp(bool value) {
    shouldCloseApp.value = value;
  }

  bool get getShouldCloseApp => shouldCloseApp.value;
}
