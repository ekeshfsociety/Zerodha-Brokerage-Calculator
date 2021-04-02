class DeliveryEquity {
  double buy;
  double sell;
  int quantity;
  double turn;
  double broke;
  double transac;

  DeliveryEquity(
    this.buy,
    this.sell,
    this.quantity,
  );

  double turnover() {
    return ((buy * quantity) + (sell * quantity));
  }

  double brokerage() {
    return 0;
  }

  double stt() {
    turn = turnover();
    return (0.001 * turn);
  }

  double transactionCharges() {
    turn = turnover();
    return (0.0000345 * turn);
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
    return (0.00015 * buy * quantity);
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
