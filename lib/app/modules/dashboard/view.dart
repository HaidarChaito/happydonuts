import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happydonuts/app/modules/cart/view.dart';
import 'package:happydonuts/app/modules/favorite/view.dart';
import 'package:happydonuts/app/modules/home/view.dart';
import 'package:happydonuts/app/widgets/bottombar.dart';

import 'controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetX<DashboardController>(
          builder: (controller) => IndexedStack(
            index: controller.bottomBarIndex.value,
            children: const [
              HomeView(),
              CartView(),
              FavoriteView(),
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomBar(),
      ),
    );
  }
}
