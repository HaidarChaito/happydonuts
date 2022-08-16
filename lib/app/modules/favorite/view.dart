import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happydonuts/app/widgets/appbar.dart';

import 'controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: 'Favorite',
      ),
    );
  }
}
