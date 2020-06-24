import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/StockProvider.dart';
import '../widgets/StockChart.dart';
import '../widgets/TabBar.dart' as TabBars;

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final _stockController = TextEditingController(); //stock ticker
    final stockProvider = Provider.of<StockProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      bottomNavigationBar: TabBars.TabBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            child: TextField(
              controller: _stockController,
              decoration: InputDecoration(labelText: 'Stock Ticker'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
            child: Text('Add Stock to Watchlist'),
            onPressed: () async {
              await stockProvider.makeGetRequest(_stockController.text, context);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: stockProvider.stockData.length,
              itemBuilder: (_, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          stockProvider.stockData[index].keys.toList()[0], // Stock Ticker
                          style: TextStyle(fontSize: 18),
                        ),
                        Container(
                          child: StockChart(
                            stockProvider.stockData[index].values.toList()[0], // Stock Chart
                            animate: true,
                          ),
                          height: 100,
                          width: 200,
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
