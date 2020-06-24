import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import './StockDetailProvider.dart';
import '../models/StockSeriesModel.dart';
import '../models/StockInfoModel.dart';

//The function of this Stock Provider is to store the current watchlisted stocks
// Example data:
// StockProvider = [
//    “APPL”: [
// 	       “2020-06-22”: 30,
//         “2020-06-23”: 30,
// 	       “2020-06-24”: 30,
//         “2020-06-25”: 30,”
// 	       ],
//    “GOOGL: [
// 	       “2020-06-22”: 30,
//         “2020-06-23”: 30,
// 	       “2020-06-24”: 30,
//         “2020-06-25”: 30,”
// 	       ],
// ]
class StockProvider with ChangeNotifier {
  List<Map<String, List<StockSeries>>> stockData = [];

  String _localhost() {
    if (Platform.isAndroid)
      return '10.0.2.2:3000';
    else // for iOS simulator
      return 'localhost:3000';
  }

  Future<void> makeGetRequest(String stockTicker, BuildContext context) async {
    final queryParameters = {
      "ticker": stockTicker,
    };
    Response response = await get(Uri.http(_localhost(), '/', queryParameters));
    _createStockData(jsonDecode(response.body), stockTicker, context);
  }

  void _createStockData(
      Map<String, dynamic> data, String stockTicker, BuildContext context) {
    // we use a provider here to call the StockDetail Provider add function
    final stockDetailProvider = Provider.of<StockDetailProvider>(context, listen: false);

    // use temporary variable so we don't call setState every iteration of loop
    List<StockSeries> tempChartData = [];
    Map<String, String> tempCardData = {};

    //extracting data from server
    for (String key in data.keys) {
      if (DateTime.tryParse(key) == null) {
        //if it not a chart data point, then it is a card data point
        tempCardData[key] = data[key];
        continue;
      }
      tempChartData.add(
        StockSeries(time: DateTime.parse(key), price: double.parse(data[key])),
      );
    }

    // - If (stock) not in provider, then *add* the values
    // - If (stock) in provider, then *update* the values
    if ((stockData.where((stock) => stock.containsKey(stockTicker)).isEmpty)) {
      // adding stock values 
      stockData.add({stockTicker: tempChartData});

      // adding stock detail values
      stockDetailProvider.addStockDetails(
          StockInfo(
            open: tempCardData['1. open'],
            high: tempCardData['2. high'],
            low: tempCardData['3. low'],
            close: tempCardData['4. close'],
            adjustedClose: tempCardData['5. adjusted close'],
            volume: tempCardData['6. volume'],
            dividendAmount: tempCardData['7. dividend amount'],
            eps: tempCardData['eps'],
            peRatio: tempCardData['pe'],
          ),
          stockTicker);
    } else {
      // updating stock values
      stockData
          .singleWhere((stock) => stock.containsKey(stockTicker))
          .update(stockTicker, (_) => tempChartData);

      // updating stock detail values
      stockDetailProvider.updateStockDetails(
          StockInfo(
            open: tempCardData['1. open'],
            high: tempCardData['2. high'],
            low: tempCardData['3. low'],
            close: tempCardData['4. close'],
            adjustedClose: tempCardData['5. adjusted close'],
            volume: tempCardData['6. volume'],
            dividendAmount: tempCardData['7. dividend amount'],
            eps: tempCardData['eps'],
            peRatio: tempCardData['pe'],
          ),
          stockTicker);
    }
    notifyListeners();
  }
}
