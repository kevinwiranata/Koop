import '../models/articleTileModel.dart';
import 'package:Koop/providers/articleProvider.dart';
import '../models/articleModel.dart';
import 'package:flutter/cupertino.dart';

class ArticleListModel extends ChangeNotifier{

  List<ArticleTileModel> articles = List<ArticleTileModel>();

  ArticleListModel(){
    _populateTopHeadlines();
  }

  void _populateTopHeadlines() async{
    List<ArticleModel> newsArticles = await ArticleProvider().fetchTopHeadlines();
    this.articles = newsArticles.map((article)=> ArticleTileModel(article: article)).toList();
    notifyListeners();
  }

}