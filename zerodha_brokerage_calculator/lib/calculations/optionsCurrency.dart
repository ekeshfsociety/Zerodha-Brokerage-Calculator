class OptionsCurrency {
  static double turnover(double buy, int quantity, double sell) {
    return double.parse(
        (((buy * quantity) + (sell * quantity)) * 1000).toStringAsFixed(2));
  }

  static double notionalTurnover(
      double buy, int quantity, double sell, double strikePrice) {
    return double.parse((((buy + strikePrice) * quantity * 1000) +
            ((sell + strikePrice) * quantity * 1000))
        .toStringAsFixed(2));
  }

  static double brokerage(
      double buy, int quantity, double sell, double strikePrice) {
    double result = 0;
    double brokerage_buy =
        (((buy + strikePrice) * quantity * 1000 * 0.0003) > 20)
            ? 20
            : ((buy + strikePrice) * quantity * 1000 * 0.0003);
    double brokerage_sell =
        (((sell + strikePrice) * quantity * 1000 * 0.0003) > 20)
            ? 20
            : ((sell + strikePrice) * quantity * 1000 * 0.0003);
    result = brokerage_buy + brokerage_sell;
    return double.parse(result.toStringAsFixed(2));
  }

  static double transactionCharges(
      double buy, int quantity, double sell, bool nse) {
    double nseCharge = (0.00035 * turnover(buy, quantity, sell));
    double bseCharge = (0.00001 * turnover(buy, quantity, sell));
    double trans;
    (nse) ? (trans = nseCharge) : (trans = bseCharge);
    return double.parse(trans.toStringAsFixed(2));
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(
      double buy, int quantity, double sell, double strikePrice, bool nse) {
    return double.parse((0.18 *
            (brokerage(buy, quantity, sell, strikePrice) +
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

  static double totalTaxes(
      double buy, int quantity, double sell, double strikePrice, bool nse) {
    return double.parse((brokerage(buy, quantity, sell, strikePrice) +
            transactionCharges(buy, quantity, sell, nse) +
            ClearingCharge() +
            gst(buy, quantity, sell, strikePrice, nse) +
            sebiCharges(buy, quantity, sell) +
            stampCharges(buy, quantity))
        .toStringAsFixed(2));
  }

  static double breakeven(
      double buy, int quantity, double sell, double strikePrice, bool nse) {
    return double.parse(
        (totalTaxes(buy, quantity, sell, strikePrice, nse) / (quantity * 1000))
            .toStringAsFixed(2));
  }

  static double pipsToBreakeven(
      double buy, int quantity, double sell, double strikePrice, bool nse) {
    return double.parse(
        ((breakeven(buy, quantity, sell, strikePrice, nse) / 0.0025)
                .ceilToDouble())
            .toStringAsFixed(2));
  }

  static double netProfit(
      double buy, int quantity, double sell, double strikePrice, bool nse) {
    return double.parse((((sell - buy) * quantity * 1000) -
            totalTaxes(buy, quantity, sell, strikePrice, nse))
        .toStringAsFixed(2));
  }
}
