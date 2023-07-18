
import 'dart:convert';

MusicPlayerModel MusicPlayerModelFromJson(String str) => MusicPlayerModel.fromJson(json.decode(str));

class MusicPlayerModel {
  final String artistName;
  final String collectionName;
  final String trackName;
  final String previewUrl;
  final String artworkUrl30;
  final num collectionPrice;
  final num trackPrice;
  final num trackRentalPrice;
  final num collectionHdPrice;
  final num trackHdPrice;
  final num trackHdRentalPrice;
  final String country;
  final String currency;
  final String primaryGenreName;
  final String shortDescription;
  final String longDescription;

  
  MusicPlayerModel({
    
  required this.artistName,
  required this.collectionName,
  required this.trackName,
  required this.previewUrl,
  required this.artworkUrl30,
  required this.collectionPrice,
  required this.trackPrice,
  required this.trackRentalPrice,
  required this.collectionHdPrice,
  required this.trackHdPrice,
  required this.trackHdRentalPrice,
  required this.country,
  required this.currency,
  required this.primaryGenreName,
  required this.shortDescription,
  required this.longDescription
  });

  factory MusicPlayerModel.fromJson(Map<String, dynamic> json) => MusicPlayerModel(
       
  artistName: json['artistName'] != null ? json['artistName'] : "",
  collectionName: json['collectionName'] != null ? json['collectionName'] : "",
  trackName: json['trackName'] != null ? json['trackName'] : "",
  previewUrl: json['previewUrl'] != null ? json['previewUrl'] : "",
  artworkUrl30: json['artworkUrl30'] != null ? json['artworkUrl30'] : "",
  collectionPrice: json['collectionPrice'] != null ? json['collectionPrice'] : 0,
  trackPrice: json['trackPrice'] != null ? json['trackPrice'] : 0,
  trackRentalPrice: json['trackRentalPrice'] != null ? json['trackRentalPrice'] : 0,
  collectionHdPrice: json['collectionHdPrice'] != null ? json['collectionHdPrice'] : 0,
  trackHdPrice: json['trackHdPrice'] != null ? json['trackHdPrice'] : 0,
  trackHdRentalPrice: json['trackHdRentalPrice'] != null ? json['trackHdRentalPrice'] : 0,
  country: json['country'] != null ? json['country'] : "",
  currency: json['currency'] != null ? json['currency'] : "",
  primaryGenreName: json['primaryGenreName'] != null ? json['primaryGenreName'] : "",
  shortDescription: json['shortDescription'] != null ? json['shortDescription'] : "",
  longDescription: json['longDescription'] != null ? json['longDescription'] : ""
      );
       
      
}

