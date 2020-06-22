import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import '../widgets/Drawer.dart';
import '../widgets/TabBar.dart' as TabBars;

class HomePage extends StatelessWidget {
  static const routeName = '/';
  static const androidIcon = Icon(Icons.home);
  static const iosIcon = Icon(CupertinoIcons.home);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Container(),
    );
  }
}
