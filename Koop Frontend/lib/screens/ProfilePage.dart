import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import '../widgets/Drawer.dart';
import '../widgets/TabBar.dart' as TabBars;

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Container(),
    );
  }
}
