class StockInfo {
  String open;
  String close;
  String high;
  String low;
  String adjustedClose;
  String volume;
  String dividendAmount;
  String eps;
  String peRatio;
  String marketCap;
  StockInfo({
    this.open,
    this.close,
    this.high,
    this.adjustedClose,
    this.dividendAmount,
    this.low,
    this.eps,
    this.volume,
    this.peRatio,
    this.marketCap
  }) {
    if (open == 'null') open = "-";
    if (close == 'null') close = "-";
    if (high == 'null') high = "-";
    if (low == 'null') low = "-";
    if (adjustedClose == 'null') adjustedClose = "-";
    if (volume == 'null') volume = "-";
    if (dividendAmount == 'null') dividendAmount = "-";
    if (eps == 'null') eps = "-";
    if (peRatio== 'null') peRatio = "-";
    if (marketCap=='null') marketCap = "-";
  }
}