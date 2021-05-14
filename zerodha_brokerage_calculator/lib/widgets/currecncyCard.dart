import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresCurrency.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsCurrency.dart';
import 'package:zerodha_brokerage_calculator/colors.dart';

import 'displayText.dart';

class Currency extends StatefulWidget {
  final Key key;
  final String name;
  final bool isFutures;
  Currency({this.key, this.name, this.isFutures});
  @override
  _CurrencyState createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  TextEditingController _buy = new TextEditingController(text: "49.2525");
  TextEditingController _sell = new TextEditingController(text: "49.2725");
  TextEditingController _quantity = new TextEditingController(text: "1");
  TextEditingController _strikePrice = new TextEditingController(text: "60.75");
  int index = 0;
  int _sliding = 0;
  double buy;
  double sell;
  int quantity;
  bool isNse = true;
  double strikePrice = 60.75;

  @override
  void initState() {
    super.initState();
    buy = double.parse(_buy.text);
    sell = double.parse(_sell.text);
    quantity = int.parse(_quantity.text);
    _buy.addListener(() {
      setState(() {
        buy = double.parse(_buy.text.isEmpty ? "0" : _buy.text);
      });
    });
    _sell.addListener(() {
      setState(() {
        sell = double.parse(_sell.text.isEmpty ? "0" : _sell.text);
      });
    });
    _quantity.addListener(() {
      setState(() {
        quantity = int.parse(_quantity.text.isEmpty ? "0" : _quantity.text);
      });
    });
    _strikePrice.addListener(() {
      setState(() {
        strikePrice =
            double.parse(_strikePrice.text.isEmpty ? "0" : _strikePrice.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        key: widget.key,
        builder: (context, height, width, sy, sx) {
          return Container(
              width: sx(500),
              decoration: BoxDecoration(
                color: cardBackground,
                borderRadius: BorderRadius.circular(sy(10)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: sy(10)),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: sy(19)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: sy(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        !widget.isFutures
                            ? Container(
                                width: sy(60),
                                child: TextFormField(
                                  controller: _strikePrice,
                                  obscureText: false,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.all(10.0),
                                      focusColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                        gapPadding: 2,
                                      ),
                                      labelText: 'Strike Price',
                                      labelStyle:
                                          TextStyle(color: Colors.white)),
                                ),
                              )
                            : Container(),
                        Container(
                          width: sy(widget.isFutures ? 60 : 40),
                          child: TextFormField(
                            controller: _buy,
                            obscureText: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  gapPadding: 2,
                                ),
                                labelText: 'Buy',
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          width: sy(widget.isFutures ? 60 : 40),
                          child: TextFormField(
                            controller: _sell,
                            obscureText: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                focusColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  gapPadding: 2,
                                ),
                                labelText: 'Sell',
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          width: sy(widget.isFutures ? 60 : 50),
                          child: TextFormField(
                            controller: _quantity,
                            obscureText: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  gapPadding: 2,
                                ),
                                labelText: 'Quantity',
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoSlidingSegmentedControl(
                      thumbColor: backgroundColor,
                      children: {
                        0: Padding(
                          padding: EdgeInsets.symmetric(horizontal: sx(50)),
                          child: Text(
                            "NSE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        1: Padding(
                            padding: EdgeInsets.symmetric(horizontal: sx(50)),
                            child: Text(
                              'BSE',
                              style: TextStyle(color: Colors.white),
                            )),
                      },
                      groupValue: _sliding,
                      onValueChanged: (newValue) {
                        setState(() {
                          _sliding = newValue;
                          if (newValue == 0) {
                            isNse = true;
                          } else {
                            isNse = false;
                          }
                        });
                      }),
                  SizedBox(
                    height: sy(10),
                  ),
                  TextCards(
                      name: "Turnover",
                      value: widget.isFutures ? FuturesCurrency.turnover(buy, quantity, sell) : OptionsCurrency.turnover(buy, quantity, sell)),
                  TextCards(
                      name: "Brokerage",
                      value:
                          widget.isFutures ? FuturesCurrency.brokerage(buy, quantity, sell) : OptionsCurrency.brokerage(buy, quantity, sell, strikePrice)),
                  TextCards(
                    name: "Exhange txn charge",
                    value: widget.isFutures
                        ? FuturesCurrency.transactionCharges(buy, quantity, sell, isNse)
                        : OptionsCurrency.transactionCharges(buy, quantity, sell, isNse),
                  ),
                  TextCards(
                    name: "Clearing Charge",
                    value: widget.isFutures
                        ? FuturesCurrency.ClearingCharge()
                        : OptionsCurrency.ClearingCharge(),
                  ),
                  TextCards(
                      name: "GST",
                      value: widget.isFutures ? FuturesCurrency.gst(buy, quantity, sell, isNse) : OptionsCurrency.gst(buy, quantity, sell, strikePrice, isNse)),
                  TextCards(
                      name: "SEBI charges",
                      value: widget.isFutures
                          ? FuturesCurrency.sebiCharges(buy, quantity, sell)
                          : OptionsCurrency.sebiCharges(buy, quantity, sell)),
                  TextCards(
                      name: "Stamp Duty",
                      value: widget.isFutures
                          ? FuturesCurrency.stampCharges(buy, quantity)
                          : OptionsCurrency.stampCharges(buy, quantity)),
                  TextCards(
                      name: "Total Tax",
                      value:
                          widget.isFutures ? FuturesCurrency.totalTaxes(buy, quantity, sell, isNse) : OptionsCurrency.totalTaxes(buy, quantity, sell, strikePrice, isNse)),
                  TextCards(
                      name: "Points to breakeven",
                      value:
                          widget.isFutures ? FuturesCurrency.breakeven(buy, quantity, sell, isNse) : OptionsCurrency.breakeven(buy, quantity, sell, strikePrice, isNse)),
                  TextCards(
                      name: "Pips to breakeven",
                      value: widget.isFutures
                          ? FuturesCurrency.pipsToBreakEven(buy, quantity, sell, isNse)
                          : OptionsCurrency.pipsToBreakeven(buy, quantity, sell, strikePrice, isNse)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Net P&L",
                          style:
                              TextStyle(color: Colors.white, fontSize: sy(18)),
                        ),
                        Text(
                          widget.isFutures
                              ? FuturesCurrency.netProfit(buy, quantity, sell, isNse).toString()
                              : OptionsCurrency.netProfit(buy, quantity, sell, strikePrice, isNse).toString(),
                          style: TextStyle(
                              color: (widget.isFutures
                                          ? FuturesCurrency.netProfit(buy, quantity, sell, isNse)
                                          : OptionsCurrency.netProfit(buy, quantity, sell, strikePrice, isNse)) >=
                                      0
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              fontSize: sy(18)),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
