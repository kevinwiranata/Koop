import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;
import '../providers/StockProvider.dart';
import '../providers/StockDetailProvider.dart';
import '../widgets/StockChart.dart';
import '../widgets/StockCard.dart';
import '../widgets/FabMenu.dart';
import '../widgets/TabBar.dart' as TabBars;

class StockDetailScreen extends StatefulWidget {
  static const routeName = '/stock-detail';

  @override
  _StockDetailScreenState createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  bool _isLoading = true;
  bool _isInit = true;
  @override
  void didChangeDependencies() async {
    if (_isInit) {
      final stockTicker = ModalRoute.of(context).settings.arguments as String;
      final stockDetailProvider = Provider.of<StockDetailProvider>(context);
      await stockDetailProvider.getStockDetails(stockTicker);
    }
    _isInit = false;
    setState(() {
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);
    final stockTicker = ModalRoute.of(context).settings.arguments as String;
    final stockDetailProvider = Provider.of<StockDetailProvider>(context);
    return Scaffold(
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      appBar: AppBar(
        title: Text(stockTicker),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 2.0,
      ),
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      //drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            child: StockChart(
              stockProvider.stockData
                  .singleWhere((stock) => stock.containsKey(stockTicker))
                  .values
                  .toList()[0],
              animate: true,
            ),
            height: 300,
            width: 320,
          ),
          _isLoading ? CircularProgressIndicator() 
          : Container(
            margin: EdgeInsets.all(20),
            child: StockCard(
                data: stockDetailProvider.stockDetailData
                    .singleWhere((stock) => stock.containsKey(stockTicker))
                    .values
                    .toList()[0],
              ),
          ),
        ],
      ),
    );
  }
}
