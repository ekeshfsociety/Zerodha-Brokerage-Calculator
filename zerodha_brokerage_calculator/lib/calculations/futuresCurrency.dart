class FuturesCurrency {
  static double turnover(double buy, int quantity, double sell) {
    return double.parse(
        (((buy * quantity) + (sell * quantity)) * 1000).toStringAsFixed(2));
  }

  static double brokerage(double buy, int quantity, double sell) {
    double result = 0;
    result += (buy * quantity * 0.0003 * 1000 > 20)
        ? 20
        : (buy * quantity * 1000 * 0.0003);
    result += (sell * quantity * 0.0003 * 1000 > 20)
        ? 20
        : (sell * quantity * 1000 * 0.0003);
    (result * 1000 > 40) ? result = 40 : result = result;
    return double.parse(result.toStringAsFixed(2));
  }

  static double transactionCharges(
      double buy, int quantity, double sell, bool nse) {
    double nseCharge = (0.000009 * turnover(buy, quantity, sell));
    double bseCharge = (0.0000022 * turnover(buy, quantity, sell));
    double trans;
    (nse) ? (trans = nseCharge) : (trans = bseCharge);
    return double.parse(trans.toStringAsFixed(2));
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(double buy, int quantity, double sell, bool nse) {
    return double.parse((0.18 *
            (brokerage(buy, quantity, sell) +
                transactionCharges(buy, quantity, sell, nse)))
        .toStringAsFixed(2));
  }

  static double sebiCharges(double buy, int quantity, double sell) {
    return double.parse(
        (0.000001 * turnover(buy, quantity, sell)).toStringAsFixed(2));
  }

  static double stampCharges(double buy, int quantity) {
    return double.parse((0.000001 * buy * quantity * 1000).toStringAsFixed(2));
  }

  static double totalTaxes(double buy, int quantity, double sell, bool nse) {
    return double.parse((brokerage(buy, quantity, sell) +
            transactionCharges(buy, quantity, sell, nse) +
            ClearingCharge() +
            gst(buy, quantity, sell, nse) +
            sebiCharges(buy, quantity, sell) +
            stampCharges(buy, quantity))
        .toStringAsFixed(2));
  }

  static double breakeven(double buy, int quantity, double sell, bool nse) {
    return double.parse(
        (totalTaxes(buy, quantity, sell, nse) / (quantity * 1000))
            .toStringAsFixed(2));
  }

  static double pipsToBreakEven(
      double buy, int quantity, double sell, bool nse) {
    return double.parse(
            (breakeven(buy, quantity, sell, nse) / 0.0025).toStringAsFixed(2))
        .ceilToDouble();
  }

  static double netProfit(double buy, int quantity, double sell, bool nse) {
    return double.parse((((sell - buy) * quantity * 1000) -
            totalTaxes(buy, quantity, sell, nse))
        .toStringAsFixed(2));
  }
}
