import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../models/StockInfoModel.dart';

class StockCard extends StatelessWidget {
  final StockInfo data;

  StockCard({this.data});

  Widget singleDetail(String title, String data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: TextStyle(fontSize: 14)),
        Text(data, style: TextStyle(fontSize: 20)),
        Padding(padding: EdgeInsets.symmetric(vertical: 4)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.compact();
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  singleDetail('Open', data.open),
                  singleDetail('Close', data.close),
                  singleDetail('High', data.high),
                  singleDetail('Low', data.low),
                  singleDetail('Dividend', data.dividendAmount),
                ],
              ),
              SizedBox(width: 120),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  singleDetail('Adj Close', data.adjustedClose),
                  singleDetail('Volume', f.format(double.parse(data.volume))),
                  singleDetail('EPS', data.eps),
                  singleDetail('PE Ratio', data.peRatio),
                  singleDetail('Market Cap', data.marketCap),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
