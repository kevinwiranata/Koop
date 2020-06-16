import 'package:flutter/material.dart';
import '../widgets/TabBar.dart' as TabBars;

class FinancePage extends StatelessWidget {
  static const routeName = '/finance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance Page'),
      ),
      bottomNavigationBar: TabBars.TabBar(),
      body: Container(),
    );
  }
}
