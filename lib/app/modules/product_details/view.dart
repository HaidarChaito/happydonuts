import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happydonuts/app/data/model/item.dart';
import 'package:happydonuts/app/data/model/item_description.dart';
import 'package:happydonuts/app/modules/home/controller.dart';
import 'package:happydonuts/app/widgets/appbar.dart';
import 'package:happydonuts/core/constants/assets.dart';
import 'package:lottie/lottie.dart';

class ProductDetailsView extends GetView<HomeController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item item = controller.getCurrentItem;
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: item.nameWithoutExtension),
        body: FutureBuilder(
          future: controller.getItemDescription(),
          builder: (context, AsyncSnapshot<ItemDescription> snapshot) {
            if (controller.isLoading) {
              return Center(
                child:
                    Lottie.asset(AppAssets.loading, height: Get.height * 0.25),
              );
            }
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Image(
                        height: Get.height * 0.3,
                        image: FirebaseImageProvider(
                          ref: controller.currentItem.ref,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 1,
                    child: Text(
                      controller.currentItemDescription.price.toString(),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      controller.currentItemDescription.description,
                    ),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator.adaptive();
            }
          },
        ),
      ),
    );
  }
}
