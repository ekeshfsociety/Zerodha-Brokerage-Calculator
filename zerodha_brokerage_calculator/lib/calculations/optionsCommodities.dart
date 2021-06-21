import 'package:zerodha_brokerage_calculator/globals.dart';

class OptionsCommodities {

  static double turnover(double buy, int quantity, double sell, String commodity, double strikePrice) {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse(((buy + sell) * multiplier * quantity).toStringAsFixed(2));
  }

  static double notionalTurnover(double buy, int quantity, double sell, String commodity, double strikePrice) {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((((buy + strikePrice) * quantity * multiplier) +
        ((sell + strikePrice) * quantity * multiplier)).toStringAsFixed(2));
  }

  static double brokerage(double buy, int quantity, double sell, String commodity, double strikePrice) {
    double result = 0;
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    double brokerage_buy = (((buy + strikePrice) * quantity * multiplier * 0.0003) > 20) ? 20 : (((buy + strikePrice) * quantity * multiplier * 0.0003)) ;
    double brokerage_sell = (((sell + strikePrice) * quantity * multiplier * 0.0003) > 20) ? 20 : (((sell + strikePrice) * quantity * multiplier * 0.0003)) ;
    result = brokerage_buy + brokerage_sell ;
    return double.parse(result.toStringAsFixed(2));
  }

  static double exchangeCharge() {
    return 0;
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(double buy, int quantity, double sell, String commodity, double strikePrice) {
    double broke = brokerage(buy, quantity, sell, commodity, strikePrice);
    return double.parse((0.18 * (broke)).toStringAsFixed(2));
  }

  static double ctt(double buy, int quantity, double sell, String commodity, double strikePrice) {
    double result = 0;
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((0.0005 * sell * quantity * multiplier).toStringAsFixed(2));
  }

  static double sebiCharges(double buy, int quantity, double sell, String commodity, double strikePrice) {
    double turn = turnover(buy, quantity, sell, commodity, strikePrice);
    return double.parse((0.000001 * turn).toStringAsFixed(2));
  }

  static double stampCharges(double buy, int quantity, double sell, String commodity, double strikePrice) {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((0.00003 * buy * quantity * multiplier).toStringAsFixed(2));
  }

  static double totalTaxes(double buy, int quantity, double sell, String commodity, double strikePrice) {
    double result =  (brokerage(buy, quantity, sell, commodity, strikePrice) +
        exchangeCharge() +
        ClearingCharge() +
        gst(buy, quantity, sell, commodity, strikePrice) +
        ctt(buy, quantity, sell, commodity, strikePrice) +
        sebiCharges(buy, quantity, sell, commodity, strikePrice) +
        stampCharges(buy, quantity, sell, commodity, strikePrice));

    return double.parse(result.toStringAsFixed(2));
  }

  static double pointsToBreakeven(double buy, int quantity, double sell, String commodity, double strikePrice) {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((totalTaxes(buy, quantity, sell, commodity, strikePrice) / (quantity * multiplier)).toStringAsFixed(2));
  }

  static double netProfit(double buy, int quantity, double sell, String commodity, double strikePrice) {
    String value = commodityOptMultiplier[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((((sell - buy) * quantity * multiplier) - totalTaxes(buy, quantity, sell, commodity, strikePrice)).toStringAsFixed(2));
  }
}
