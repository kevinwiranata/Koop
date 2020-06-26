import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/TabProvider.dart';
import './providers/StockProvider.dart';
import './providers/StockDetailProvider.dart';
import './screens/HomePage.dart';
import './screens/ProfilePage.dart';
import './screens/SearchPage.dart';
import './screens/FinancePage.dart';
import './screens/StockDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomePage(),
      SearchPage(),
      FinancePage(),
      ProfilePage()
    ];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TabProvider()),
        ChangeNotifierProvider(create: (ctx) => StockProvider()),
        ChangeNotifierProvider(create: (ctx) => StockDetailProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          accentColor: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Consumer<TabProvider>(
            builder: (_, tabState, child) => screens[tabState.currentIndex]),
        routes: {
          SearchPage.routeName: (ctx) => SearchPage(),
          FinancePage.routeName: (ctx) => FinancePage(),
          ProfilePage.routeName: (ctx) => ProfilePage(),
          StockDetailScreen.routeName: (ctx) => StockDetailScreen(),
        },
      ),
    );
  }
}
