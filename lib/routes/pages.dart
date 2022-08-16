import 'package:get/route_manager.dart';
import 'package:happydonuts/app/modules/cart/binding.dart';
import 'package:happydonuts/app/modules/cart/view.dart';
import 'package:happydonuts/app/modules/dashboard/binding.dart';
import 'package:happydonuts/app/modules/dashboard/view.dart';
import 'package:happydonuts/app/modules/favorite/binding.dart';
import 'package:happydonuts/app/modules/favorite/view.dart';
import 'package:happydonuts/app/modules/home/binding.dart';
import 'package:happydonuts/app/modules/home/view.dart';
import 'package:happydonuts/app/modules/product_details/view.dart';
import 'routes.dart';

List<GetPage> pages = [
  // main route
  GetPage(
    name: AppRoutes.dashboard,
    page: () => const DashboardView(),
    binding: DashboardBinding(),
  ),
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoutes.productDetails,
    page: () => const ProductDetailsView(),
  ),
  GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
      binding: CartBinding()),
  GetPage(
    name: AppRoutes.favorite,
    page: () => const FavoriteView(),
    binding: FavoriteBinding(),
  ),
];
