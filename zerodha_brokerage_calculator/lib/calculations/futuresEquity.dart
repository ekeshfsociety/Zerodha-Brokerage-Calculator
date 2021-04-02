class IntraDayEquity {
  double buy;
  double sell;
  int quantity;
  double turn;
  double broke;
  double transac;

  IntraDayEquity(
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
}
