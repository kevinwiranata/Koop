import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import '../models/StockSeriesModel.dart';

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
    try {
      Response response = await get(
        Uri.http(_localhost(), '/', queryParameters),
      );
      _createStockData(jsonDecode(response.body), stockTicker, context);
    } catch (error) {
      print(error);
      return;
    }
  }

  void _createStockData(
      Map<String, dynamic> data, String stockTicker, BuildContext context) {
    // use temporary variable so we don't call setState every iteration of loop
    List<StockSeries> tempChartData = [];

    //extracting data from server
    for (String key in data.keys) {
      tempChartData.add(
        StockSeries(time: DateTime.parse(key), price: double.parse(data[key])),
      );
    }

    // - If (stock) not in provider, then *add* the values
    // - If (stock) in provider, then *update* the values

    if ((stockData.where((stock) => stock.containsKey(stockTicker)).isEmpty)) {
      // adding stock values
      stockData.add({stockTicker: tempChartData});
    } else {
      // updating stock values
      stockData
          .singleWhere((stock) => stock.containsKey(stockTicker))
          .update(stockTicker, (_) => tempChartData);
    }
    notifyListeners();
  }
}