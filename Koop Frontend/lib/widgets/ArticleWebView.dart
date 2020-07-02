import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget{
  final String url;

  ArticleWebView({this.url});

  @override
  _ArticleWebViewState createState()=> _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView>{
  @override

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child:WebView(
            initialUrl: widget.url,
            onWebViewCreated: (WebViewController webViewController) {
              _completer.complete(webViewController);
            },
          )
      ),
    );
  }
}