import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/TabProvider.dart';

class TabBar extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // since everytime we navigate to a new page the tabBar rebuilds
    // we must get the current state or "which tab" we are in from the tab provider (or else it will always be home or index 0)
    final tabProvider = Provider.of<TabProvider>(context); 
    _currentIndex = tabProvider.currentIndex;
    //cupertino tab (instead of bottomNavigationalBar) allows us not to use text in the buttons
    return CupertinoTabBar( 
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.grey),
          activeIcon: Icon(Icons.home, color: Colors.blueGrey),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, color: Colors.grey),
          activeIcon: Icon(Icons.search, color: Colors.blueGrey),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment, color: Colors.grey),
          activeIcon: Icon(Icons.payment, color: Colors.blueGrey),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          activeIcon: Icon(Icons.person, color: Colors.blueGrey),
        ),
      ],
      onTap: (index) {
      tabProvider.changeTab(index); // when we navigate into a new page, we update the state in the provider
      }
    );
  }
}
