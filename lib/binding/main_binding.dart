import 'package:angler_music/controllers/music_player_controller.dart';
import 'package:angler_music/controllers/splash_controller.dart';
import 'package:angler_music/preferences/app_preference.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppPreference>(()=> AppPreference(), fenix: true);
    Get.lazyPut<SplashController>(()=> SplashController(), fenix: true);
    Get.lazyPut<MusicPlayerController>(()=> MusicPlayerController(), fenix: true);
    
  }
}