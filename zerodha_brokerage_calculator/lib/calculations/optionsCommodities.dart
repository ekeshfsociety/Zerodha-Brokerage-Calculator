import 'package:zerodha_brokerage_calculator/globals.dart';

class OptionsCommodities {
  String commodity;
  double strikePrice;
  double buy;
  double sell;
  int quantity;
  double turn;
  double broke;
  double transac;

  OptionsCommodities(
      this.commodity, this.strikePrice, this.buy, this.sell, this.quantity);

  double turnover() {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return ((buy + sell) * multiplier * quantity);
  }

  double notionalTurnover() {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return (((buy + strikePrice) * quantity * multiplier) +
        ((sell + strikePrice) * quantity * multiplier));
  }

  double brokerage() {
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

  double exchangeCharge() {
    return 0;
  }

  double ClearingCharge() {
    return 0;
  }

  double gst() {
    broke = brokerage();
    return (0.18 * (broke));
  }

  double ctt() {
    double result = 0;
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return (0.0005 * sell * quantity * multiplier);
  }

  double sebiCharges() {
    turn = turnover();
    return (0.0000005 * turn);
  }

  double stampCharges() {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return (0.00003 * buy * quantity * multiplier);
  }

  double totalTaxes() {
    return (brokerage() +
        exchangeCharge() +
        ClearingCharge() +
        gst() +
        ctt() +
        sebiCharges() +
        stampCharges());
  }

  double pointsToBreakeven() {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return (totalTaxes() / (quantity * multiplier));
  }

  double netProfit() {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return (((sell - buy) * quantity * multiplier) - totalTaxes());
  }
}
