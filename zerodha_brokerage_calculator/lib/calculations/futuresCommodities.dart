import 'package:zerodha_brokerage_calculator/globals.dart';

class FuturesCommodities {

  static double turnover(double buy, int quantity, double sell,String commodity) {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((((buy + sell) * multiplier * quantity)).toStringAsFixed(2));
  }

  static double brokerage(double buy, int quantity, double sell, String commodity) {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    double brokerage_buy = 0;
    double brokerage_sell = 0;

    if((buy * multiplier * quantity) > 200000) {
      brokerage_buy = 20;
    }
    else {
      brokerage_buy = ((buy * multiplier *quantity * 0.0003) > 20) ? 20 : (buy * multiplier * 0.0003 * quantity);
    }

    if((sell * multiplier * quantity) > 200000) {
      brokerage_sell = 20;
    }
    else {
      brokerage_sell = ((sell * multiplier *quantity * 0.0003) > 20) ? 20 : (sell * multiplier * 0.0003 * quantity);
    }

    return double.parse(((brokerage_buy + brokerage_sell)).toStringAsFixed(2));
  }

  static double transactionCharges(double buy, int quantity, double sell, String commodity) {
    double turn = turnover(buy, quantity, sell, commodity);
    double trans ;
    String value = commodityMultiplierMap[commodity];
    String newValue = value.substring(value.length - 1);
    (newValue == 'a') ? (trans = (0.000026 * turn)) : (trans = (0.0000005 * turn)) ;

    if(commodity == 'RBDPMOLEIN') {
      if(turnover(buy, quantity, sell, commodity) > 100000)
        {
          double rbd_multiplier = (turnover(buy, quantity, sell, commodity) / 100000);
          trans = rbd_multiplier ;
        }
    }

    if(commodity == 'CASTORSEED') {
      trans = (0.000005 * turnover(buy, quantity, sell, commodity));
    }
    else if(commodity == 'RBDMPOLEIN') {
      trans = (0.00001 * turnover(buy, quantity, sell, commodity));
    }
    else if(commodity == 'PEPPER') {
      trans = (0.0000005 * turnover(buy, quantity, sell, commodity));
    }
    else if(commodity == 'KAPAS') {
      trans = (0.000026 * turnover(buy, quantity, sell, commodity));
    }

    return double.parse((trans).toStringAsFixed(2));
  }

  static double ClearingCharge() {
    return 0;
  }

  static double gst(double buy, int quantity, double sell, String commodity) {
    double broke = brokerage(buy, quantity, sell, commodity);
    double transac = transactionCharges(buy, quantity, sell, commodity);
    return double.parse((0.18 * (broke + transac)).toStringAsFixed(2));
  }

  static double ctt(double buy, int quantity, double sell, String commodity) {
    double result = 0;
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    String newValue = value.substring(value.length - 1);
    if (newValue == 'a') {
      result = (0.0001 * sell * quantity * multiplier);
    }
    else {
      result = 0 ;
    }
    return double.parse(result.toStringAsFixed(2));
  }

  static double sebiCharges(double buy, int quantity, double sell, String commodity) {
    double turn = turnover(buy, quantity, sell, commodity);
    double sebiTax = turn * 0.0000005 ;
    String value = commodityGroupMap[commodity];
    String newValue = value.substring(value.length - 1);
    (newValue == 'a')
        ? (sebiTax = turn * 0.0000001)
        : (sebiTax = turn * 0.000001);
    return double.parse(sebiTax.toStringAsFixed(2));
  }

  static double stampCharges(double buy, int quantity, double sell, String commodity) {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    double result;
    result = buy * quantity * multiplier * 0.00002;
    return double.parse(result.toStringAsFixed(2));
  }

  static double totalTaxes(double buy, int quantity, double sell, String commodity) {
    double totalTaxes =  (brokerage(buy, quantity, sell, commodity) +
        transactionCharges(buy, quantity, sell, commodity) +
        ClearingCharge() +
        gst(buy, quantity, sell, commodity) +
        ctt(buy, quantity, sell, commodity) +
        sebiCharges(buy, quantity, sell, commodity) +
        stampCharges(buy, quantity, sell, commodity)) ;
    return double.parse(totalTaxes.toStringAsFixed(2));
  }

  static double pointsToBreakeven(double buy, int quantity, double sell, String commodity) {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((totalTaxes(buy, quantity, sell, commodity) / (quantity * multiplier)).toStringAsFixed(2));
  }

  static double netProfit(double buy, int quantity, double sell, String commodity) {
    String value = commodityMultiplierMap[commodity];
    double multiplier = double.parse(value.substring(0, (value.length - 1)));
    return double.parse((((sell - buy) * quantity * multiplier) - totalTaxes(buy, quantity, sell, commodity)).toStringAsFixed(2));
  }
}
