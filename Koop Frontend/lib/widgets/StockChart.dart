import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/StockSeriesModel.dart';
import 'package:charts_flutter/flutter.dart';
import './TextStyle.dart' as style;
import 'package:charts_flutter/src/text_element.dart' as element;
import 'dart:math';

class StockChart extends StatelessWidget {
  final List<StockSeries> stockData;
  final bool animate;
  static double ticker;
  StockChart(this.stockData, {this.animate});

  @override
  Widget build(BuildContext context) {
    List<Series<StockSeries, DateTime>> series = [
      Series(
        id: 'id',
        data: stockData,
        domainFn: (StockSeries series, _) => series.time,
        measureFn: (StockSeries series, _) => series.price,
      ),
      // dateTimeFactory: const charts.LocalDateTimeFactory(),
    ];
    return TimeSeriesChart(
      series,
      animate: true,
      dateTimeFactory: const LocalDateTimeFactory(),
      domainAxis: DateTimeAxisSpec(
        tickFormatterSpec: new AutoDateTimeTickFormatterSpec(
          day: TimeFormatterSpec(
            format: 'd',
            transitionFormat: 'MM/dd/yyyy',
          ),
        ),
        showAxisLine: true,
      ),
      primaryMeasureAxis: AxisSpec(
        tickProviderSpec: BasicNumericTickProviderSpec(
          zeroBound: false,
        ),
      ),
      behaviors: [
        SelectNearest(eventTrigger: SelectionTrigger.tapAndDrag),
        LinePointHighlighter(
          symbolRenderer: CustomCircleSymbolRenderer(ticker: ticker),
        )
      ],
      selectionModels: [
        SelectionModelConfig(
          changedListener: (SelectionModel model) {
            if (model.hasDatumSelection)
              ticker = model.selectedSeries[0]
                  .measureFn(model.selectedDatum[0].index);
          },
        ),
      ],
    );
  }
}

class CustomCircleSymbolRenderer extends CircleSymbolRenderer {
  double ticker;

  CustomCircleSymbolRenderer({this.ticker});
  @override
  void paint(ChartCanvas canvas, Rectangle<num> bounds,
      {List<int> dashPattern,
      Color fillColor,
      FillPatternType fillPattern,
      Color strokeColor,
      double strokeWidthPx}) {
    super.paint(canvas, bounds,
        dashPattern: dashPattern,
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidthPx: strokeWidthPx);
    canvas.drawRect(
        Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 50,
            bounds.height + 10),
        fill: Color.white);
    var textStyle = style.TextStyle();
    textStyle.color = Color.black;
    textStyle.fontSize = 15;
    canvas.drawText(
        element.TextElement(StockChart.ticker.toStringAsFixed(2),
            style: textStyle),
        (bounds.left).round(),
        (bounds.top - 28).round());
  }
}