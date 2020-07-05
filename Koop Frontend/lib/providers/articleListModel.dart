import '../models/articleTileModel.dart';
import 'package:Koop/providers/articleProvider.dart';
import '../models/articleModel.dart';
import 'package:flutter/cupertino.dart';

class ArticleListModel extends ChangeNotifier{
  bool isLoading = true;
  List<ArticleTileModel> articles = List<ArticleTileModel>();

  ArticleListModel() {
    _populateTopHeadlines();
  }

  Future<void> getArticles() async{
    List<ArticleModel> newsArticles = await ArticleProvider().fetchTopHeadlines();
    this.articles = newsArticles.map((article)=> ArticleTileModel(article: article)).toList();
    return;
  }
  
  void _populateTopHeadlines() async{
    await getArticles();
    isLoading = false;
    notifyListeners();
  }

}