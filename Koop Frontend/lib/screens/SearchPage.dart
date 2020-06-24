import 'package:flutter/material.dart';
import '../widgets/TabBar.dart' as TabBars;

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
      ),
      bottomNavigationBar: TabBars.TabBar(),
      body: Container(),
    );
  }
}
