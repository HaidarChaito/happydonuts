import 'package:get/get.dart';
import 'package:happydonuts/app/modules/cart/controller.dart';
import 'package:happydonuts/app/modules/favorite/controller.dart';
import 'package:happydonuts/app/modules/home/controller.dart';
import 'controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController(), permanent: true);
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
