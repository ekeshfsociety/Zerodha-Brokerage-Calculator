class DeliveryEquity {
  static double turnover(double buy, double sell, int quantity) {
    return double.parse(
        ((buy * quantity) + (sell * quantity)).toStringAsFixed(2));
  }

  static double brokerage() {
    return 0;
  }

  static int stt(double buy, double sell, int quantity) {
    return (double.parse(
            (0.001 * turnover(buy, sell, quantity)).toStringAsFixed(2)))
        .round();
  }

  static double transactionCharges(double buy, double sell, int quantity) {
    return double.parse(
        (0.0000345 * turnover(buy, sell, quantity)).toStringAsFixed(2));
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

  static double stampCharges(double buy, double sell, int quantity) {
    return double.parse((0.00015 * buy * quantity).toStringAsFixed(2));
  }

  static double totalTaxes(double buy, double sell, int quantity) {
    return double.parse((brokerage() +
            stt(buy, sell, quantity) +
            transactionCharges(buy, sell, quantity) +
            ClearingCharge() +
            gst(buy, sell, quantity) +
            sebiCharges(buy, sell, quantity) +
            stampCharges(buy, sell, quantity))
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
