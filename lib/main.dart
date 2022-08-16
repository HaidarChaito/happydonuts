import 'package:firebase_cached_image/firebase_cached_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:happydonuts/core/services/app_services.dart';
import 'package:happydonuts/firebase_options.dart';
import 'core/theme/theme.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseCacheManager.initialize();
  await initAppServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppServices appServices = Get.find();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Happy Donuts',
      initialRoute: AppRoutes.dashboard,
      getPages: pages,
      themeMode: appServices.isDarkMode ? ThemeMode.dark : ThemeMode.dark,
      theme: lightThemeData,
      darkTheme: darkThemeData,
    );
  }
}
