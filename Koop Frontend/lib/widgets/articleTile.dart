import 'package:flutter/material.dart';
import './ArticleWebView.dart';
import './TickerTile.dart';
import './PercentChangeTile.dart';

class ArticleTile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String siteName;
  final String url;

  ArticleTile(this.title, this.description, this.imageUrl, this.content,
      this.siteName, this.url);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleWebView(url: url)));
      },
      child: Container(
        width: screenWidth,
        height: screenHeight * 115 / 812,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      bottom: screenWidth * 10 / 365,
                      left: 0,
                      child: TickerTile(),
                    ),
                    Positioned(
                      bottom: screenWidth * 10 / 365,
                      left: screenWidth * 50 / 375,
                      child: PercentChangeTile(),
                    ),
                    Positioned(
                      bottom: screenWidth * 11.5 / 365,
                      left: screenWidth * 170 / 375,
                      child: Container(
                        height: screenHeight * 16 / 812,
                        width: screenWidth * 85 / 375,
                        child: Text(
                          siteName,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF6A6A6A),
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                  fontSize: 16.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(11.0),
                  child: imageUrl != null
                      ? Image.network(imageUrl,
                          height: screenHeight * 90 / 812,
                          width: screenWidth * 93 / 375,
                          fit: BoxFit.cover)
                      : Container(
                          height: screenHeight * 90 / 812,
                          width: screenWidth * 93 / 375,
                          color: Colors.blueGrey)),
            ],
          ),
        ),
      ),
    );
  }
}
