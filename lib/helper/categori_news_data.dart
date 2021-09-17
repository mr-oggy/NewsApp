import 'dart:convert';

import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;

class CategoryNewsData {
  List<ArticalModel> newsData = [];
  Future<void> getCategoryData(String category) async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=in&category=$category&category=business&apiKey=API_KEY';
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
