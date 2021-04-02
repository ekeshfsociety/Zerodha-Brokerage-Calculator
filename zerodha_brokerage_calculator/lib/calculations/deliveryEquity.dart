class DeliveryEquity {

  static double turnover(double buy, double sell, int quantity) {
    return ((buy * quantity) + (sell * quantity));
  }

 static  double brokerage() {
    return 0;
  }

  static double stt(double buy, double sell, int quantity) {
    return (0.001 * turnover(buy, sell, quantity));
  }

  static double transactionCharges(double buy, double sell, int quantity) {
    return (0.0000345 * turnover(buy, sell, quantity));
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(double buy, double sell, int quantity) {
    return (0.18 * (brokerage() + transactionCharges(buy, sell, quantity)));
  }

  static double sebiCharges(double buy, double sell, int quantity) {
    return (0.0000005 * turnover(buy, sell, quantity));
  }

  static double stampCharges(double buy, double sell, int quantity) {
    return (0.00015 * buy * quantity);
  }

  static double totalTaxes(double buy, double sell, int quantity) {
    return (brokerage() +
        stt(buy, sell, quantity) +
        transactionCharges(buy, sell, quantity) +
        ClearingCharge() +
        gst(buy, sell, quantity) +
        sebiCharges(buy, sell, quantity) +
        stampCharges(buy, sell, quantity));
  }

  static double breakeven(double buy, double sell, int quantity) {
    return (totalTaxes(buy, sell, quantity) / quantity);
  }

  static double netProfit(double buy, double sell, int quantity) {
    return (((sell - buy) * quantity) - totalTaxes(buy, sell, quantity));
  }
}
