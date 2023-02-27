import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=5f9996b6ae3e4488997904849d04b218";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
