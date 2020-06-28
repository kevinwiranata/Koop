import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';
import '../models/StockInfoModel.dart';

//The function of this Stock Provider is to store the current watchlisted stocks
// Example data:
// StockDetailProvider = [
//    “APPL”: {
// 		“open”: 20.22,
// 		“close”: 21.21,
// 		“low”: 20.28,
// 		“adjustedClose”: 20.32,
// 		“volume”: 12010292,
// 		“dividentAmount”: 0,
// 		“eps”: 0.2,
// 		“peRatio”: 2.1,
// 		},
//
//    “GOOGL”: {
// 		“open”: 20.22,
// 		“close”: 21.21,
// 		“low”: 20.28,
// 		“adjustedClose”: 20.32,
// 		“volume”: 12010292,
// 		“dividentAmount”: 0,
// 		“eps”: 0.2,
// 		“peRatio”: 2.1,
// 		},
// ]

class StockDetailProvider with ChangeNotifier {
  List<Map<String, StockInfo>> stockDetailData = [];

  StockInfo findStockDetail(String stockTicker) {
    return stockDetailData
        .singleWhere((stock) => stock.containsKey(stockTicker))
        .values
        .toList()[0];
  }

  String _localhost() {
    if (Platform.isAndroid)
      return '10.0.2.2:3000';
    else // for iOS simulator
      return 'localhost:3000';
  }

  Future<void> fetchAPIStockDetails(String stockTicker) async {
    final queryParameters = {
      "ticker": stockTicker,
    };
    try {
      Response response = await get(
        Uri.http(_localhost(), '/stocks/details', queryParameters),
      );
      var jsonResponse = jsonDecode(response.body);
      StockInfo stockDetails = StockInfo(
        high: jsonResponse['high'].toString(),
        low: jsonResponse['low'].toString(),
        open: jsonResponse['open'].toString(),
        close: jsonResponse['close'].toString(),
        volume: jsonResponse['volume'].toString(),
        adjustedClose: jsonResponse['adj_low'].toString(),
        dividendAmount: jsonResponse['dividend'].toString(),
        eps: jsonResponse['eps'].toString(),
        peRatio: jsonResponse['pe'].toString(),
      );
      if ((stockDetailData
          .where((stock) => stock.containsKey(stockTicker))
          .isEmpty)) {
        addStockDetails(stockDetails, stockTicker);
      } else {
        updateStockDetails(stockDetails, stockTicker);
      }
    } catch (error) {
      print(error);
      return;
    }
  }

  void addStockDetails(StockInfo newStockDetail, String stockTicker) {
    stockDetailData.add({stockTicker: newStockDetail});
    notifyListeners();
  }

  void updateStockDetails(StockInfo newStockDetail, String stockTicker) {
    stockDetailData
        .singleWhere((stockDetail) => stockDetail.containsKey(stockTicker))
        .update(stockTicker, (_) => newStockDetail);
    notifyListeners();
  }
}
