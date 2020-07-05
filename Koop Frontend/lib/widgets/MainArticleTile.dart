import 'package:flutter/material.dart';
import './ArticleWebView.dart';
import './TickerTile.dart';
import './PercentChangeTile.dart';

class MainArticleTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String siteName;
  final String url;

  MainArticleTile(this.title, this.description, this.imageUrl, this.content,
      this.siteName, this.url);
  
  @override
  Widget build(BuildContext context){
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => ArticleWebView(url:url)));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right:15.0, top: 10.0),
        child: Container(
          width : screenWidth,
          height: screenHeight * 342.5/812,
          child: Column(
            children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(11.0),
                child: imageUrl != null
                    ? Image.network(imageUrl,
                        height: screenHeight * 240 / 812,
                        width: double.infinity,
                        fit: BoxFit.cover)
                    : Container(
                        height: screenHeight * 240 / 812,
                        width: double.infinity,
                        color: Colors.blueGrey)),
            Padding(
              padding: const EdgeInsets.only(top: 7.5),
              child: Text(title, style: TextStyle(
                fontSize:19.0,
                color:Colors.black87,
                fontWeight: FontWeight.w400
              ),
              maxLines: 2,
              ),
            ),
            Container(
              width: double.infinity,
              height: screenHeight * 41/812,
              child: Stack(children: <Widget>[
                Positioned(
                  left: 0,
                  bottom: screenWidth * 5 / 365,
                  child: TickerTile()
                ),
                Positioned(
                  left: screenWidth * 50/375,
                  bottom: screenWidth * 5/365,
                  child: PercentChangeTile() 
                ),
                Positioned(
                  right:0,
                  bottom: screenWidth * 7.5/365,
                  child: Text(siteName, style: TextStyle(
                    color: Color(0xFF6A6A6A),
                    fontSize: 10.0,
                    fontWeight: FontWeight.w300
                  ),

                  )
                )
              ],),
            )
            
          ],)

        ),
      )
    );

  }

}