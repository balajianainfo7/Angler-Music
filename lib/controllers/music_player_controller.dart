import 'dart:async';
import 'dart:convert';
import 'package:angler_music/models/music_player_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'base_controller.dart';

class MusicPlayerController extends BaseController {
  final TextEditingController searchController = TextEditingController();
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    fetchMusic();
  }

  var MusicModel = StreamController<List<MusicPlayerModel>>.broadcast();
  Stream<List<MusicPlayerModel>> getMusicModel() => MusicModel.stream;

  fetchMusic() async {
    final url = Uri.parse("https://itunes.apple.com/search?term=John");
    print(url);

    final response = await http.get(Uri.parse(url.toString()));

    final Map<String, dynamic> body = json.decode(response.body);
    if (response.statusCode == 200) {
      print(body);
    }

    MusicModel.add(List<MusicPlayerModel>.from(
        body["results"].map((x) => MusicPlayerModel.fromJson(x))));
  }
}
