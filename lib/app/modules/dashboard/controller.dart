import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt bottomBarIndex = 0.obs;
  void setBottomBarIndex(int index) {
    bottomBarIndex.value = index;
  }
}
