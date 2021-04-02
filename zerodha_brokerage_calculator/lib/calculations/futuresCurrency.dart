class FuturesCurrency {
  double buy;
  double sell;
  int quantity;
  double turn;
  double broke;
  double transac;
  bool nse;

  FuturesCurrency(this.buy, this.sell, this.quantity, this.nse);

  double turnover() {
    return (((buy * quantity) + (sell * quantity)) * 1000);
  }

  double brokerage() {
    double result = 0;
    result += (buy * quantity * 0.0003 * 1000 > 20)
        ? 20
        : (buy * quantity * 1000 * 0.0003);
    result += (sell * quantity * 0.0003 * 1000 > 20)
        ? 20
        : (sell * quantity * 1000 * 0.0003);
    (result * 1000 > 40) ? result = 40 : result = result;
    return result;
  }

  double stt() {
    return 0;
  }

  double transactionCharges() {
    turn = turnover();
    double nseCharge = (0.000009 * turn);
    double bseCharge = (0.0000022 * turn);
    double trans;
    (nse) ? (trans = nseCharge) : (trans = bseCharge);
    return trans;
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
    return (0.000001 * buy * quantity * 1000);
  }
}
