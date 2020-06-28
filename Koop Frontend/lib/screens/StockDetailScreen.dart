import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
      floatingActionButton: Platform.isAndroid ? FabMenu() : null,
      bottomNavigationBar: Platform.isIOS ? TabBars.TabBar() : null,
      //drawer: Platform.isAndroid ? AndroidDrawer() : null,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CarouselSlider.builder(
              itemCount: stockProvider.stockData.length,
              itemBuilder: (context, index) => Container(
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(stockProvider.stockData[index].keys.toList()[0]),
                        Text(
                          stockProvider
                              .findStockSeries(stockProvider
                                  .stockData[index].keys
                                  .toList()[0])
                              .last
                              .price
                              .toString(),
                        ),
                      ],
                    ),
                    Container(
                      child: StockChart(
                        stockProvider.stockData[index].values.toList()[0],
                        renderSpec: false,
                        isBull: stockProvider.isBullStock(
                            stockProvider.stockData[index].keys.toList()[0]),
                        animate: true,
                      ),
                      width: MediaQuery.of(context).size.width * 1 / 4.8,
                    ),
                  ],
                ),
              ),
              options: CarouselOptions(
                height: 50,
                viewportFraction: 0.35,
                autoPlay: true,
                autoPlayInterval: Duration(milliseconds: 100),
                autoPlayAnimationDuration: Duration(seconds: 7),
                autoPlayCurve: Curves.linear,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      stockTicker,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 20),
                    child: StockChart(
                      stockProvider.findStockSeries(stockTicker),
                      renderSpec: true,
                      isBull: stockProvider.isBullStock(stockTicker),
                      animate: true,
                    ),
                    height: 300,
                    width: 320,
                  ),
                  _isLoading
                      ? CircularProgressIndicator()
                      : Container(
                          margin: EdgeInsets.all(20),
                          child: StockCard(
                            data: stockDetailProvider
                                .findStockDetail(stockTicker),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
