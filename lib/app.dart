import 'package:angler_music/resources/app_routes.dart';
import 'package:angler_music/resources/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'binding/main_binding.dart';
import 'preferences/app_preference.dart';

class App extends StatelessWidget {
  static final App _instance = App._internal();
  
  App._internal();

  final appPref = Get.put(AppPreference());

  factory App() {
    return _instance;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      defaultTransition: Transition.leftToRight,
      title: 'Angler Music',
      theme: AppStyles.lightTheme(),
      
      
      getPages: Routes.routes,
      initialRoute: RouteNames.splash,
    );
  }
  
}