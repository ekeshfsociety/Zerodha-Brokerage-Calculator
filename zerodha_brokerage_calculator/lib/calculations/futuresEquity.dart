class FuturesEquity {
  static double turnover(double buy, double sell, int quantity) {
    return double.parse(
        ((buy * quantity) + (sell * quantity)).toStringAsFixed(2));
  }

  static double brokerage(double buy, double sell, int quantity) {
    double result = 0;
    result += (buy * quantity * 0.0003 > 20) ? 20 : (buy * quantity * 0.0003);
    result += (sell * quantity * 0.0003 > 20) ? 20 : (sell * quantity * 0.0003);
    return double.parse(result.toStringAsFixed(2));
  }

  static int stt(double sell, int quantity) {
    return double.parse((sell * quantity * 0.0001).toStringAsFixed(2)).round();
  }

  static double transactionCharges(double buy, double sell, int quantity, bool nse) {
      double nseCharge = (0.00002 * turnover(buy, sell, quantity));
      double bseCharge = 0;
      double trans;
      (nse) ? (trans = nseCharge) : (trans = bseCharge);
      return double.parse(trans.toStringAsFixed(2));
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(double buy, double sell, int quantity, bool nse) {
    return double.parse((0.18 *
            (brokerage(buy, sell, quantity) +
                transactionCharges(buy, sell, quantity, nse)))
        .toStringAsFixed(2));
  }

  static double sebiCharges(double buy, double sell, int quantity) {
    return double.parse(
        (0.000001 * turnover(buy, sell, quantity)).toStringAsFixed(2));
  }

  static double stampCharges(double buy, int quantity) {
    return double.parse((0.00002 * buy * quantity).toStringAsFixed(2));
  }

  static double totalTaxes(double buy, double sell, int quantity, bool nse) {
    return double.parse((brokerage(buy, sell, quantity) +
            stt(sell, quantity) +
            transactionCharges(buy, sell, quantity, nse) +
            ClearingCharge() +
            gst(buy, sell, quantity, nse) +
            sebiCharges(buy, sell, quantity) +
            stampCharges(buy, quantity))
        .toStringAsFixed(2));
  }

  static double breakeven(double buy, double sell, int quantity, nse) {
    return double.parse(
        (totalTaxes(buy, sell, quantity, nse) / quantity).toStringAsFixed(2));
  }

  static double netProfit(double buy, double sell, int quantity, bool nse) {
    return double.parse(
        (((sell - buy) * quantity) - totalTaxes(buy, sell, quantity, nse))
            .toStringAsFixed(2));
  }
}
