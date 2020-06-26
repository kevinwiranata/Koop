import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import '../widgets/Drawer.dart';
import '../widgets/TabBar.dart' as TabBars;
import '../widgets/FabMenu.dart';


class SearchPage extends StatelessWidget {
  static const routeName = '/search';
  static const androidIcon = Icon(Icons.search);
  static const iosIcon = Icon(CupertinoIcons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      appBar: AppBar(
        title: Text('Search Page'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation:2.0,
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
//      drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Container(),
    );
  }
}
