import 'package:flutter/material.dart';
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

  void addStockDetails(StockInfo newStockDetail, String stockTicker) {
    stockDetailData.add({stockTicker: newStockDetail});
    print(stockDetailData);
  }

  void updateStockDetails(StockInfo newStockDetail, String stockTicker) {
    stockDetailData
        .singleWhere((stockDetail) => stockDetail.containsKey(stockTicker))
        .update(stockTicker, (_) => newStockDetail);
  }
  notifyListeners();
}
