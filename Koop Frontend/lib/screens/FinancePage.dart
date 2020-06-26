import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import '../widgets/Drawer.dart';
import '../widgets/TabBar.dart' as TabBars;
import 'dart:io' show Platform;
import '../widgets/FabMenu.dart';



class FinancePage extends StatelessWidget {
  static const routeName = '/finance';
  static const androidIcon = Icon(Icons.attach_money);
  static const iosIcon = Icon(CupertinoIcons.folder);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      appBar: AppBar(
        title: Text('Finance Page'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2.0,
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      //drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Container(),
    );
  }
}
