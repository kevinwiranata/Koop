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
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Icon(Icons.person_pin, size: 100.0,),
                ),
                Text('John Doe', style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ))
              ]
            )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            dense:true,
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(height: 0.0),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            dense:true,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(SearchPage.routeName);
            },
          ),
          Divider(height: 0.0),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Finance'),
            dense:true,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FinancePage.routeName);
            },
          ),
          Divider(height: 0.0),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            dense:true,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);
            },
          )
        ],
      ),
    );
  }
}
