import './articleModel.dart';

class ArticleTileModel{
  ArticleModel _articleModel;

  ArticleTileModel({ArticleModel article}): _articleModel = article;

  String get title{
    return _articleModel.title;
  }

  String get description {
    return _articleModel.description;
  }

  String get urlToImage{
    return _articleModel.urlToImage;
  }

  String get url {
    return _articleModel.url;
  }

  String get content {
    return _articleModel.content;
  }

  String get name {
    return _articleModel.name;
  }

}