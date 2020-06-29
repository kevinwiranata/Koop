import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../providers/StockProvider.dart';
import './StockChart.dart';

class StockCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stockProvider = Provider.of<StockProvider>(context);
    return CarouselSlider.builder(
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
                      .findStockSeries(
                          stockProvider.stockData[index].keys.toList()[0])
                      .first
                      .price
                      .toString(),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(2.3),
                    child: SizedBox(
                      child: Text(
                        stockProvider.priceDifferent(
                          stockProvider.stockData[index].keys.toList()[0],
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 16,
                      width: 60 ,
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
            Container(
              alignment: Alignment.centerLeft,
              child: StockChart(
                stockProvider.stockData[index].values.toList()[0],
                renderSpec: false,
                isBull: stockProvider.isBullStock(
                    stockProvider.stockData[index].keys.toList()[0]),
                animate: true,
              ),
              width: MediaQuery.of(context).size.width * 1 / 4.6,
            ),
          ],
        ),
      ),
      options: CarouselOptions(
        disableCenter: true,
        viewportFraction: 0.4,
        height: 70,
        autoPlay: true,
        autoPlayInterval: Duration(milliseconds: 100),
        autoPlayAnimationDuration: Duration(seconds: 4),
        autoPlayCurve: Curves.linear,
        scrollDirection: Axis.horizontal,
        scrollPhysics: BouncingScrollPhysics(),
      ),
    );
  }
}
