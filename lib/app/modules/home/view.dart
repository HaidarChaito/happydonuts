import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happydonuts/app/data/model/item.dart';
import 'package:happydonuts/app/widgets/appbar.dart';
import 'package:happydonuts/core/constants/assets.dart';
import 'package:lottie/lottie.dart';

import 'controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            SizedBox(height: Get.height * 0.01),
            FutureBuilder(
              future: controller.getItems(),
              builder: (context, AsyncSnapshot<List<Item>> snapshot) {
                if (controller.isLoading) {
                  return Center(
                    child: Lottie.asset(AppAssets.loading,
                        height: Get.height * 0.25),
                  );
                }
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: Get.height * 0.2,
                      viewportFraction: 0.7,
                      autoPlay: true,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index, realIndex) => InkWell(
                      onTap: () {
                        controller.setCurrentItem(snapshot.data![index]);
                        controller.toProductDetails();
                      },
                      child: Image(
                        height: Get.height * 0.3,
                        image: FirebaseImageProvider(
                          ref: snapshot.data![index].ref,
                        ),
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator.adaptive();
                }
              },
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (ctx, index) => Lottie.asset(AppAssets.loading),
              ),
            )
          ],
        ),
      ),
    );
  }
}
