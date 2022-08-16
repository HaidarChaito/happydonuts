import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:happydonuts/app/modules/dashboard/controller.dart';
import 'package:happydonuts/core/constants/color.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) => FancyBottomBar(
        selectedIndex: controller.bottomBarIndex.value,
        onItemSelected: (index) => controller.setBottomBarIndex(index),
        items: [
          FancyItem(
            textColor: AppColor.secondary,
            title: 'Home',
            icon: const Icon(
              Icons.home,
              color: AppColor.secondary,
            ),
          ),
          FancyItem(
            textColor: AppColor.blue,
            title: 'Cart',
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColor.blue,
            ),
          ),
          FancyItem(
            textColor: AppColor.error,
            title: 'Favorite',
            icon: const Icon(
              Icons.favorite,
              color: AppColor.error,
            ),
          ),
        ],
      ),
    );
  }
}
