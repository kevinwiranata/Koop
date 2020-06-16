import 'package:flutter/material.dart';
import '../widgets/TabBar.dart' as TabBars;

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      bottomNavigationBar: TabBars.TabBar(),
      body: Container(),
    );
  }
}
