import 'package:fab_circular_menu/fab_circular_menu.dart';
import '../widgets/FabMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/Drawer.dart';
import '../widgets/TabBar.dart' as TabBars;
import 'dart:io' show Platform;



class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const androidIcon = Icon(Icons.home);
  static const iosIcon = Icon(CupertinoIcons.home);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      appBar: AppBar(
          centerTitle: true,
          elevation: 2.0,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          title: Platform.isAndroid ? Text(
            'Koop',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ) : null ,
          backgroundColor: Theme.of(context).primaryColor),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      body: Stack(
        children: <Widget>[
            
        Container(),
      ]),
    );
  }
}

