class FuturesEquity {

  static double turnover(double buy, double sell, int quantity) {
    return ((buy * quantity) + (sell * quantity));
  }

  static double brokerage(double buy, double sell, int quantity) {
    double result = 0;
    result += (buy * quantity * 0.0003 > 20) ? 20 : (buy * quantity * 0.0003);
    result += (sell * quantity * 0.0003 > 20) ? 20 : (sell * quantity * 0.0003);
    return result;
  }

 static  double stt(double sell, int quantity) {
    return (sell * quantity * 0.0001);
  }

  static double transactionCharges(double buy, double sell, int quantity) {
    return (0.00002 * turnover(buy, sell, quantity));
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(double buy, double sell, int quantity) {
    return (0.18 * (brokerage(buy, sell, quantity) + transactionCharges(buy, sell, quantity)));
  }

 static  double sebiCharges(double buy, double sell, int quantity) {
    return (0.0000005 * turnover(buy, sell, quantity));
  }

 static double stampCharges(double buy, int quantity) {
    return (0.00002 * buy * quantity);
  }

 static double totalTaxes(double buy, double sell, int quantity) {
    return (brokerage(buy, sell, quantity) +
        stt(sell, quantity) +
        transactionCharges(buy, sell, quantity) +
        ClearingCharge() +
        gst(buy, sell, quantity) +
        sebiCharges(buy, sell, quantity) +
        stampCharges(buy, quantity));
  }

 static double breakeven(double buy, double sell, int quantity) {
    return (totalTaxes(buy, sell, quantity)/ quantity);
  }

 static double netProfit(double buy, double sell, int quantity) {
    return (((sell - buy) * quantity) - totalTaxes(buy, sell, quantity));
  }
}