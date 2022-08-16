import 'package:flutter/material.dart';
import 'package:happydonuts/core/constants/color.dart';

import 'color_schemes.g.dart';

ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: AppColor.white,
  bottomAppBarColor: AppColor.white,
  bottomAppBarTheme: const BottomAppBarTheme(elevation: 0),
);
ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  bottomAppBarColor: Colors.black12,
  bottomAppBarTheme: const BottomAppBarTheme(elevation: 0),
);
