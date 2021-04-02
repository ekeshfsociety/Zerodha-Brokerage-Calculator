import 'package:zerodha_brokerage_calculator/globals.dart';

class FuturesCommodities {
  String commodity;
  double buy;
  double sell;
  int quantity;
  double turn;
  double broke;
  double transac;

  FuturesCommodities(this.commodity, this.buy, this.sell, this.quantity);

  double turnover() {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return ((buy + sell) * multiplier * quantity);
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

  double transactionCharges() {
    turn = turnover();
    double categoryA = (0.000026 * turn);
    double categoryB = (0.0000005 * turn);
    double trans;
    String value = commodityMultiplierMap[commodity];
    String newValue = value.substring(value.length - 1);
    (newValue == 'a') ? (trans = categoryA) : (trans = categoryB);
    return trans;
  }

  double ClearingCharge() {
    return 0;
  }

  double gst() {
    broke = brokerage();
    transac = transactionCharges();
    return (0.18 * (broke + transac));
  }

  double ctt() {
    double result = 0;
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    String newValue = value.substring(value.length - 1);
    if (newValue == 'a') {
      result = (0.0001 * sell * quantity * multiplier);
    }
    return result;
  }

  double sebiCharges() {
    turn = turnover();
    double sebiTax;
    String value = commodityGroupMap[commodity];
    String newValue = value.substring(value.length - 1);
    (newValue == 'a')
        ? (sebiTax = turn * 0.0000001)
        : (sebiTax = turn * 0.0000005);
    return sebiTax;
  }

  double stampCharges() {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    double result;
    result = buy * quantity * multiplier * 0.00002;
    return result;
  }

  double totalTaxes() {
    return (brokerage() +
        transactionCharges() +
        ClearingCharge() +
        gst() +
        ctt() +
        sebiCharges() +
        stampCharges());
  }

  double pointsToBreakeven() {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return (totalTaxes() / (quantity * multiplier));
  }

  double netProfit() {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return (((sell - buy) * quantity * multiplier) - totalTaxes());
  }
}
