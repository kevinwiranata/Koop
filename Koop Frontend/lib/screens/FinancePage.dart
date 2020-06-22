import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import '../widgets/Drawer.dart';
import '../widgets/TabBar.dart' as TabBars;

class FinancePage extends StatelessWidget {
  static const routeName = '/finance';
  static const androidIcon = Icon(Icons.attach_money);
  static const iosIcon = Icon(CupertinoIcons.folder);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance Page'),
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Container(),
    );
  }
}
