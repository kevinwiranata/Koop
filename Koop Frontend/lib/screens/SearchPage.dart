import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import '../widgets/TabBar.dart' as TabBars;
import '../widgets/FabMenu.dart';
import '../widgets/articleList.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      appBar: AppBar(
        title: Text('Search Page'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2.0,
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      body: ArticleList(),
    );
  }
}
