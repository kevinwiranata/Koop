import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../models/StockInfoModel.dart';

class StockCard extends StatelessWidget {
  final StockInfo data;

  StockCard({this.data});

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.compact();
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Open:       ' + data.open),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text('High:        ' + data.high),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text('Low:         ' + data.low),
                ],
              ),
              VerticalDivider(
                color: Colors.black,
                thickness: 1,
                endIndent: 35,
                width: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Vol:                ' +
                      f.format(double.parse(data.volume))),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text('Close:            ' + data.close),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text('Adj Close:      ' + data.adjustedClose),
                ],
              ),
              VerticalDivider(
                color: Colors.black,
                thickness: 1,
                endIndent: 35,
                width: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Dividend:     ' + data.dividendAmount),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text('EPS:              ' + data.eps),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                  Text('PE Ratio:       ' + data.peRatio),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
