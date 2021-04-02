class OptionsEquity {

  static double turnover(double buy, double sell, int quantity) {
    return ((buy * quantity) + (sell * quantity));
  }

  static double brokerage() {
    return 40;
  }

  static double stt(double sell, int quantity) {
    return (sell * quantity * 0.0005);
  }

  static double transactionCharges(double buy, double sell, int quantity) {
    return (0.00053 * turnover(buy, sell, quantity));
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

  static double stampCharges(double buy,int quantity) {
    return (0.00003 * buy * quantity);
  }

  static double totalTaxes(double buy, double sell, int quantity) {
    return (brokerage() +
        stt(sell, quantity) +
        transactionCharges(buy, sell, quantity) +
        ClearingCharge() +
        gst(buy, sell, quantity) +
        sebiCharges(buy, sell, quantity) +
        stampCharges(buy, quantity));
  }

 static double breakeven(double buy, double sell, int quantity) {
    return (totalTaxes(buy, sell, quantity) / quantity);
  }

  static double netProfit(double buy, double sell, int quantity) {
    return (((sell - buy) * quantity) - totalTaxes(buy, sell, quantity));
  }
}
