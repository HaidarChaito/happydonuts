import 'package:flutter/material.dart';
import 'package:happydonuts/core/constants/assets.dart';
import 'package:lottie/lottie.dart';

class ErrorCenter extends StatelessWidget {
  const ErrorCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAssets.error,
        repeat: false,
      ),
    );
  }
}
