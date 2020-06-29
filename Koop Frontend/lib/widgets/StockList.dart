import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/StockProvider.dart';
import '../screens/StockDetailScreen.dart';
import './StockChart.dart';

class StockList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);

    return ListView.builder(
      itemCount: stockProvider.stockData.length,
      itemBuilder: (_, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, StockDetailScreen.routeName,
              arguments: stockProvider.stockData[index].keys
                  .toList()[0]); // sending the stock ticker as an argument
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                Column(
                  children: <Widget>[
                    Text(
                      stockProvider.stockData[index].keys
                          .toList()[0], // Stock Ticker
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
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
                  ],
                ),
                Container(
                  child: StockChart(
                    stockProvider.stockData[index].values.toList()[0],
                    isBull: stockProvider.isBullStock(
                        stockProvider.stockData[index].keys.toList()[0]),
                    renderSpec: false, // Stock Chart
                    animate: true,
                  ),
                  height: 100,
                  width: 200,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.3),
                    child: SizedBox(
                      child: Text(
                        stockProvider.percentageChange(
                          stockProvider.stockData[index].keys.toList()[0],
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 16,
                      width: 60,
                    ),
                  ),
                  elevation: 0,
                  color: stockProvider.isBullStock(
                          stockProvider.stockData[index].keys.toList()[0])
                      ? Colors.green
                      : Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
