import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;
import '../providers/StockProvider.dart';
import '../providers/StockDetailProvider.dart';
import '../widgets/StockChart.dart';
import '../widgets/StockCard.dart';
import '../widgets/Carousel.dart';
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
      await stockDetailProvider.fetchAPIStockDetails(stockTicker);
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
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              )
          : AppBar(
              ),
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      //drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                StockCarousel(),
                SizedBox(height: 10),
                Text(
                  stockTicker,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      stockProvider
                          .findStockSeries(stockTicker)
                          .first
                          .price
                          .toString(),
                      style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                    ),
                    // Text(' | '),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      stockProvider.priceDifferent(
                        stockTicker,
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: stockProvider.isBullStock(stockTicker)
                              ? Colors.green[600]
                              : Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  child: StockChart(
                    stockProvider.findStockSeries(stockTicker),
                    renderSpec: true,
                    isBull: stockProvider.isBullStock(stockTicker),
                    animate: true,
                  ),
                  height: 300,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                _isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        margin: EdgeInsets.all(20),
                        child: StockCard(
                          data:
                              stockDetailProvider.findStockDetail(stockTicker),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
