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
              arguments: stockProvider.stockData[index].keys.toList()[0]); // sending the stock ticker as an argument 
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  stockProvider.stockData[index].keys
                      .toList()[0], // Stock Ticker
                  style: TextStyle(fontSize: 18),
                ),
                Container(
                  child: StockChart(
                    stockProvider.stockData[index].values
                        .toList()[0], // Stock Chart
                    animate: true,
                  ),
                  height: 100,
                  width: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
