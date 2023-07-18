import 'package:angler_music/views/auth/splash.dart';
import 'package:angler_music/views/home_page/home_page.dart';
import 'package:angler_music/views/music_home/music_page.dart';
import 'package:angler_music/views/music_home/music_search.dart';
import 'package:get/get.dart';

class Routes {
  //this is to prevent anyone from instantiating this object
  Routes._();

  /// routes list
  static List<GetPage<dynamic>> routes = [
    GetPage(name: RouteNames.splash, page: () => Splash()),
    GetPage(name: RouteNames.home, page: () => homePage()),
    GetPage(name: RouteNames.musicPlayer, page: () => const MusicPlayerPage()),
    GetPage(name: RouteNames.musicSearch, page: () => const MusicDetailedPage()),
  ];
}

class RouteNames {
  /// Your password screen
  static const splash = '/splash';
  static const home = '/home_page';
  static const musicPlayer = '/music_page';
  static const musicSearch = '/music_search';
}
