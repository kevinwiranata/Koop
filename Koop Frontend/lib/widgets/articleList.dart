import 'package:flutter/material.dart';
import 'package:Koop/providers/articleListModel.dart';
import 'package:provider/provider.dart';
import 'package:Koop/widgets/articleTile.dart';
import './MainArticleTile.dart';
class ArticleList extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    var isLoading = Provider.of<ArticleListModel>(context).isLoading;
    final articleListProvider = Provider.of<ArticleListModel>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return isLoading
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
      itemCount: articleListProvider.articles.length-1,
      itemBuilder: (context, index){
        return(
          index == 0 
          ? MainArticleTile(
            articleListProvider.articles[index].title,
            articleListProvider.articles[index].description,
            articleListProvider.articles[index].urlToImage,
            articleListProvider.articles[index].content,
            articleListProvider.articles[index].name,
            articleListProvider.articles[index].url,
          )
          : ArticleTile(
            articleListProvider.articles[index+1].title,
            articleListProvider.articles[index+1].description,
            articleListProvider.articles[index+1].urlToImage,
            articleListProvider.articles[index+1].content,
            articleListProvider.articles[index+1].name,
            articleListProvider.articles[index+1].url,
          )
        );
      }
    );
  }
}