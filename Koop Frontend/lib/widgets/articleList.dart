import 'package:flutter/material.dart';
import 'package:Koop/providers/articleListModel.dart';
import 'package:provider/provider.dart';
import 'package:Koop/widgets/articleTile.dart';

class ArticleList extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    final articleListProvider = Provider.of<ArticleListModel>(context);
    return ListView.builder(
      itemCount: articleListProvider.articles.length,
      itemBuilder: (context, index){
        return(
          ArticleTile(articleListProvider.articles[index].title,
                      articleListProvider.articles[index].description,
                      articleListProvider.articles[index].urlToImage,
                      articleListProvider.articles[index].content,
                      articleListProvider.articles[index].name,
                      articleListProvider.articles[index].url,
          )
        );
      }
    );
  }
}