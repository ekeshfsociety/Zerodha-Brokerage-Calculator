class OptionsEquity {
  double buy;
  double sell;
  int quantity;
  double turn;
  double broke;
  double transac;

  OptionsEquity(
    this.buy,
    this.sell,
    this.quantity,
  );

  double turnover() {
    return ((buy * quantity) + (sell * quantity));
  }

  double brokerage() {
    return 40;
  }

  double stt() {
    return (sell * quantity * 0.0005);
  }

  double transactionCharges() {
    turn = turnover();
    return (0.00053 * turn);
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
    return (0.00003 * buy * quantity);
  }
}
