class OptionsCurrency {

 static double turnover(double buy, int quantity , double sell) {
    return (((buy * quantity) + (sell * quantity)) * 1000);
  }

  static double notionalTurnover(double buy, int quantity , double sell, double strikePrice) {
    return (((buy + strikePrice) * quantity * 1000) +
        ((sell + strikePrice) * quantity * 1000));
  }

 static double brokerage(double buy, int quantity , double sell, double strikePrice) {
    double result = 0;
    result += ((buy + strikePrice) * quantity * 1000 * 0.0003 > 20)
        ? 20
        : (buy * quantity * 0.0003 * 1000);
    result += ((sell + strikePrice) * quantity * 1000 * 0.0003 > 20)
        ? 20
        : (sell * quantity * 0.0003 * 1000);
    (result * 1000 > 40) ? result = 40 : result = result * 1000;
    return result;
  }

 static double transactionCharges(double buy, int quantity , double sell, bool nse) {
    double nseCharge = (0.00035 * turnover(buy, quantity, sell));
    double bseCharge = (0.00001 * turnover(buy, quantity, sell));
    double trans;
    (nse) ? (trans = nseCharge) : (trans = bseCharge);
    return trans;
  }

 static double ClearingCharge() {
    return 0;
  }

 static double gst(double buy, int quantity , double sell, double strikePrice, bool nse) {
    return (0.18 * (brokerage(buy, quantity, sell, strikePrice) + transactionCharges(buy, quantity, sell, nse)));
  }

 static double sebiCharges(double buy, int quantity , double sell) {
    return (0.0000005 * turnover(buy, quantity, sell));
  }

 static double stampCharges(double buy, int quantity) {
    return (0.000001 * buy * quantity * 1000);
  }

 static double totalTaxes(double buy, int quantity , double sell, double strikePrice, bool nse) {
    return (brokerage(buy, quantity, sell, strikePrice) +
        transactionCharges(buy, quantity, sell, nse) +
        ClearingCharge() +
        gst(buy, quantity, sell, strikePrice, nse) +
        sebiCharges(buy, quantity, sell) +
        stampCharges(buy, quantity));
  }

 static double breakeven(double buy, int quantity , double sell, double strikePrice, bool nse) {
    return (totalTaxes(buy, quantity, sell, strikePrice, nse) / (quantity * 1000));
  }

 static double pipsToBreakeven(double buy, int quantity , double sell, double strikePrice, bool nse) {
    return ((breakeven(buy, quantity, sell, strikePrice, nse) / 0.0025).ceilToDouble());
  }

 static double netProfit(double buy, int quantity , double sell, double strikePrice, bool nse) {
    return (((sell - buy) * quantity * 1000) - totalTaxes(buy, quantity, sell, strikePrice, nse));
  }
}
