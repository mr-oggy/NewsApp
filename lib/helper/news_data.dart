import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsData {
  List<ArticalModel> newsData = [];
  Future<void> getNewsData() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&apiKey=2be47d4c09364b70b11cacdcab10af34';
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (e) {
          if (e['urlToImage'] != null && e['description'] != null) {
            ArticalModel articalModel = ArticalModel.fromJson(e);
            newsData.add(articalModel);
          }
        },
      );
    }
  }
}
