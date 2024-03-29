import '../models/articleTileModel.dart';
import '../models/articleModel.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleListProvider extends ChangeNotifier {
  bool isLoading = true;
  List<ArticleTileModel> articles = List<ArticleTileModel>();

  ArticleListProvider() {
    _populateTopHeadlines();
  }

  Future<void> getArticles() async {
    List<ArticleModel> newsArticles = await fetchTopHeadlines();
    this.articles = newsArticles
        .map((article) => ArticleTileModel(article: article))
        .toList();
    return;
  }

  void _populateTopHeadlines() async {
    await getArticles();
    isLoading = false;
    notifyListeners();
  }

  Future<List<ArticleModel>> fetchTopHeadlines() async {
    String url =
        'http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=3e7a1721e3ca45c28aad69546f4591a5';
    print('test2');
    final response = await http.get(url);
    print("test3");
    if (response.statusCode == 200) {
          print("tes4");
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => ArticleModel.fromJSON(article)).toList();
    } else {
          print("test5");
      throw Exception("Failed to get Top news");
    }
  }
}
