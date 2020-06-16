import 'package:flutter/material.dart';
import '../widgets/TabBar.dart' as TabBars;

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      bottomNavigationBar: TabBars.TabBar(),
      body: Container(),
    );
  }
}
