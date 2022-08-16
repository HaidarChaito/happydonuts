import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happydonuts/app/widgets/appbar.dart';

import 'controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        title: 'Cart',
      ),
    );
  }
}
