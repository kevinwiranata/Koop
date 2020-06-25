import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../widgets/Drawer.dart';
import '../widgets/TabBar.dart' as TabBars;
import '../widgets/FabMenu.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation:2.0,
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
//      drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Container(),
    );
  }
}
