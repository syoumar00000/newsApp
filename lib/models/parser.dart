import 'package:http/http.dart';
import 'package:webfeed/webfeed.dart';
import 'dart:async';


class Parser {
  final url = "http://www.france24.com/fr/actualites/rss";
  Future chargerRSS() async {
    final reponse = await get(url);
    if(reponse.statusCode == 200){
      final feed = RssFeed.parse(reponse.body);
      return feed;
    } else {
      print("Erreur: ${reponse.statusCode}");
    }
  }

}