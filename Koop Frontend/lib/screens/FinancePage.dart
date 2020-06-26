import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import '../widgets/TabBar.dart' as TabBars;
import '../widgets/FabMenu.dart';
//import '../widgets/Drawer.dart';



class FinancePage extends StatelessWidget {
  static const routeName = '/finance';
  
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