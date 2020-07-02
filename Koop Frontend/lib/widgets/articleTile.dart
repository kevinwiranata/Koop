import 'package:flutter/material.dart';
import '../models/articleModel.dart';
import './ArticleWebView.dart';
class ArticleTile extends StatelessWidget{
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String siteName;
  final String url;

  ArticleTile(this.title, this.description, this.imageUrl, this.content, this.siteName, this.url);

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleWebView(url : url)));
        },
        child: Stack(
          children: <Widget>[
            ListTile(
              trailing: Container(
                width: screenWidth*0.25,
                height: screenHeight*0.125,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(11.0))),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(imageUrl))),
                  title: Text(title,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  )),
                  subtitle: Text(siteName,
                  style:TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Color(0x6A6A6AFF),
                    fontSize: 10.0,
                  ),
                  ),
            ),
              
          ]
        ),
    );
  }


}