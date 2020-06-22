import 'package:flutter/material.dart';
import '../screens/SearchPage.dart';
import '../screens/FinancePage.dart';
import '../screens/ProfilePage.dart';

class AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Koop'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SearchPage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Finance'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FinancePage.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);
            },
          )
        ],
      ),
    );
  }
}
