class FuturesEquity {
  double buy;
  double sell;
  int quantity;
  double turn;
  double broke;
  double transac;

  FuturesEquity(
    this.buy,
    this.sell,
    this.quantity,
  );

  double turnover() {
    return ((buy * quantity) + (sell * quantity));
  }

  double brokerage() {
    double result = 0;
    result += (buy * quantity * 0.0003 > 20) ? 20 : (buy * quantity * 0.0003);
    result += (sell * quantity * 0.0003 > 20) ? 20 : (sell * quantity * 0.0003);
    return result;
  }

  double stt() {
    return (sell * quantity * 0.0001);
  }

  double transactionCharges() {
    turn = turnover();
    return (0.00002 * turn);
  }

  double ClearingCharge() {
    return 0;
  }

  double gst() {
    broke = brokerage();
    transac = transactionCharges();
    return (0.18 * (broke + transac));
  }

  double sebiCharges() {
    turn = turnover();
    return (0.0000005 * turn);
  }

  double stampCharges() {
    return (0.00002 * buy * quantity);
  }

  double totalTaxes() {
    return (brokerage() +
        stt() +
        transactionCharges() +
        ClearingCharge() +
        gst() +
        sebiCharges() +
        stampCharges());
  }

  double breakeven() {
    return (totalTaxes() / quantity);
  }

  double netProfit() {
    return (((sell - buy) * quantity) - totalTaxes());
  }
}
