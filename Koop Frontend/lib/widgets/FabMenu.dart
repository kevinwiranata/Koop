import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import '../screens/SearchPage.dart';
import '../screens/FinancePage.dart';
import '../screens/ProfilePage.dart';

class FabMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      ringDiameter: 300.0,
      //actual width: 411.4, height: 683.4
      ringWidth: 70.0,
      alignment: Alignment.bottomLeft,
      children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: IconButton(icon: Icon(Icons.home), onPressed: () {
              print(MediaQuery.of(context).size);
               Navigator.of(context).pushReplacementNamed('/');
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: IconButton(icon: Icon(Icons.search), onPressed: () {
              Navigator.of(context).pushReplacementNamed(SearchPage.routeName);
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: IconButton(icon: Icon(Icons.payment), onPressed: (){
              Navigator.of(context).pushReplacementNamed(FinancePage.routeName);
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: IconButton(icon: Icon(Icons.person), onPressed: (){
              Navigator.of(context).pushReplacementNamed(ProfilePage.routeName);
            }),
          ),
      ],
    );
  }
}
