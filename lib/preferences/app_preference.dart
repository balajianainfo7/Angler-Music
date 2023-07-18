// ignore_for_file: override_on_non_overriding_member


import 'package:angler_music/preferences/pref_helper.dart';
import 'package:get_storage/get_storage.dart';


class AppPreference extends PreferenceHelper {
  var pref = GetStorage("anglerpref");


  removePreference() {
    pref.erase();
  }

  
}
