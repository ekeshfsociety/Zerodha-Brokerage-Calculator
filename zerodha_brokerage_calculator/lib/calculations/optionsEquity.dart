class OptionsEquity {
  static double turnover(double buy, double sell, int quantity) {
    return double.parse(
        ((buy * quantity) + (sell * quantity)).toStringAsFixed(2));
  }

  static double brokerage() {
    return 40;
  }

  static int stt(double sell, int quantity) {
    return double.parse((sell * quantity * 0.0005).toStringAsFixed(2)).round();
  }

  static double transactionCharges(double buy, double sell, int quantity) {
    return double.parse(
        (0.00053 * turnover(buy, sell, quantity)).toStringAsFixed(2));
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(double buy, double sell, int quantity) {
    return double.parse(
        (0.18 * (brokerage() + transactionCharges(buy, sell, quantity)))
            .toStringAsFixed(2));
  }

  static double sebiCharges(double buy, double sell, int quantity) {
    return double.parse(
        (0.000001 * turnover(buy, sell, quantity)).toStringAsFixed(2));
  }

  static double stampCharges(double buy, int quantity) {
    return double.parse((0.00003 * buy * quantity).toStringAsFixed(2));
  }

  static double totalTaxes(double buy, double sell, int quantity) {
    return double.parse((brokerage() +
            stt(sell, quantity) +
            transactionCharges(buy, sell, quantity) +
            ClearingCharge() +
            gst(buy, sell, quantity) +
            sebiCharges(buy, sell, quantity) +
            stampCharges(buy, quantity))
        .toStringAsFixed(2));
  }

  static double breakeven(double buy, double sell, int quantity) {
    return double.parse(
        (totalTaxes(buy, sell, quantity) / quantity).toStringAsFixed(2));
  }

  static double netProfit(double buy, double sell, int quantity) {
    return double.parse(
        (((sell - buy) * quantity) - totalTaxes(buy, sell, quantity))
            .toStringAsFixed(2));
  }
}
