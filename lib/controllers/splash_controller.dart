import 'package:angler_music/controllers/base_controller.dart';
import 'package:angler_music/resources/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    checkLogin();
    super.onInit();
  }

  checkLogin() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      Get.toNamed(RouteNames.home);
    });
  }
}
