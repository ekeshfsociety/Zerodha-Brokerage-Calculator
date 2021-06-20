import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/calculations/deliveryEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/intradayEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsEquity.dart';
import 'package:zerodha_brokerage_calculator/colors.dart';

import 'displayText.dart';

class EquitiesCard extends StatefulWidget {
  final Key key;
  final String name;
  EquitiesCard({this.key, this.name}): super(key: key);
  @override
  _EquitiesCardState createState() => _EquitiesCardState();
}

class _EquitiesCardState extends State<EquitiesCard> {
  TextEditingController _buy = new TextEditingController(text: "1000");
  TextEditingController _sell = new TextEditingController(text: "1100");
  TextEditingController _quantity = new TextEditingController(text: "400");
  int index = 0;
  List functions = [
    IntraDayEquity,
    DeliveryEquity,
    FuturesEquity,
    OptionsEquity
  ];
  int _sliding = 0;
  double buy;
  double sell;
  int quantity;

  double returnTurnOver() {
    switch (index) {
      case 0:
        return IntraDayEquity.turnover(buy, sell, quantity);
      case 1:
        return DeliveryEquity.turnover(buy, sell, quantity);
      case 2:
        return FuturesEquity.turnover(buy, sell, quantity);
      case 3:
        return OptionsEquity.turnover(buy, sell, quantity);
      default:
        return IntraDayEquity.turnover(buy, sell, quantity);
    }
  }

  double returnBrokerage() {
    switch (index) {
      case 0:
        return IntraDayEquity.brokerage(buy, sell, quantity);
      case 1:
        return DeliveryEquity.brokerage();
      case 2:
        return FuturesEquity.brokerage(buy, sell, quantity);
      case 3:
        return OptionsEquity.brokerage();
      default:
        return IntraDayEquity.brokerage(buy, sell, quantity);
    }
  }

  double returnSTT() {
    switch (index) {
      case 0:
        return IntraDayEquity.stt(buy, sell, quantity).toDouble();
      case 1:
        return DeliveryEquity.stt(buy, sell, quantity).toDouble();
      case 2:
        return FuturesEquity.stt(sell, quantity).toDouble();
      case 3:
        return OptionsEquity.stt(sell, quantity).toDouble();
      default:
        return IntraDayEquity.stt(buy, sell, quantity).toDouble();
    }
  }

  double returnTxnCharge() {
    switch (index) {
      case 0:
        return IntraDayEquity.transactionCharges(buy, sell, quantity);
      case 1:
        return DeliveryEquity.transactionCharges(buy, sell, quantity);
      case 2:
        return FuturesEquity.transactionCharges(buy, sell, quantity);
      case 3:
        return OptionsEquity.transactionCharges(buy, sell, quantity);
      default:
        return IntraDayEquity.transactionCharges(buy, sell, quantity);
    }
  }

  double returnClearCharge() {
    switch (index) {
      case 0:
        return IntraDayEquity.ClearingCharge();
      case 1:
        return DeliveryEquity.ClearingCharge();
      case 2:
        return FuturesEquity.ClearingCharge();
      case 3:
        return OptionsEquity.ClearingCharge();
      default:
        return IntraDayEquity.ClearingCharge();
    }
  }

  double returnGST() {
    switch (index) {
      case 0:
        return IntraDayEquity.gst(buy, sell, quantity);
      case 1:
        return DeliveryEquity.gst(buy, sell, quantity);
      case 2:
        return FuturesEquity.gst(buy, sell, quantity);
      case 3:
        return OptionsEquity.gst(buy, sell, quantity);
      default:
        return IntraDayEquity.gst(buy, sell, quantity);
    }
  }

  double returnSEBICharges() {
    switch (index) {
      case 0:
        return IntraDayEquity.sebiCharges(buy, sell, quantity);
      case 1:
        return DeliveryEquity.sebiCharges(buy, sell, quantity);
      case 2:
        return FuturesEquity.sebiCharges(buy, sell, quantity);
      case 3:
        return OptionsEquity.sebiCharges(buy, sell, quantity);
      default:
        return IntraDayEquity.sebiCharges(buy, sell, quantity);
    }
  }

  double returnStamp() {
    switch (index) {
      case 0:
        return IntraDayEquity.stampCharges(buy, quantity);
      case 1:
        return DeliveryEquity.stampCharges(buy, sell, quantity);
      case 2:
        return FuturesEquity.stampCharges(buy, quantity);
      case 3:
        return OptionsEquity.stampCharges(buy, quantity);
      default:
        return IntraDayEquity.stampCharges(buy, quantity);
    }
  }

  double returnTotalTax() {
    switch (index) {
      case 0:
        return IntraDayEquity.totalTaxes(buy, sell, quantity);
      case 1:
        return DeliveryEquity.totalTaxes(buy, sell, quantity);
      case 2:
        return FuturesEquity.totalTaxes(buy, sell, quantity);
      case 3:
        return OptionsEquity.totalTaxes(buy, sell, quantity);
      default:
        return IntraDayEquity.totalTaxes(buy, sell, quantity);
    }
  }

  double returnBreakeven() {
    switch (index) {
      case 0:
        return IntraDayEquity.breakeven(buy, sell, quantity);
      case 1:
        return DeliveryEquity.breakeven(buy, sell, quantity);
      case 2:
        return FuturesEquity.breakeven(buy, sell, quantity);
      case 3:
        return OptionsEquity.breakeven(buy, sell, quantity);
      default:
        return IntraDayEquity.breakeven(buy, sell, quantity);
    }
  }

  double returnPL() {
    switch (index) {
      case 0:
        return IntraDayEquity.netProfit(buy, sell, quantity);
      case 1:
        return DeliveryEquity.netProfit(buy, sell, quantity);
      case 2:
        return FuturesEquity.netProfit(buy, sell, quantity);
      case 3:
        return OptionsEquity.netProfit(buy, sell, quantity);
      default:
        return IntraDayEquity.netProfit(buy, sell, quantity);
    }
  }

  @override
  void initState() {
    super.initState();
    buy = double.parse(_buy.text);
    sell = double.parse(_sell.text);
    quantity = int.parse(_quantity.text);
    switch (widget.name) {
      case "Intraday Equity":
        index = 0;
        break;
      case "Delivery Equity":
        index = 1;
        break;
      case "F&O - Futures":
        index = 2;
        break;
      case "F&O - Options":
        index = 3;
        break;
    }
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
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        key: widget.key,
        builder: (context, height, width, sy, sx) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 80,
                    color: Color(0xFFF1F1F1),
                    child: Center(
                      child: Text(
                        widget.name,
                        style: GoogleFonts.lato(
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 88,
                          child: TextFormField(
                            controller: _buy,
                            obscureText: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              focusColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                gapPadding: 2,
                              ),
                              labelText: 'BUY',
                              labelStyle:
                              TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 88,
                          child: TextFormField(
                            controller: _sell,
                            obscureText: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              focusColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                gapPadding: 2,
                              ),
                              labelText: 'SELL',
                              labelStyle:
                              TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          width: 88,
                          child: TextFormField(
                            controller: _sell,
                            obscureText: false,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              focusColor: Colors.black,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                gapPadding: 2,
                              ),
                              labelText: 'QUANTITY',
                              labelStyle:
                              TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70),
                      child: CupertinoSlidingSegmentedControl(
                          children: {
                            0: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50),
                              child: Text(
                                'NSE',
                                style:
                                TextStyle(color: Colors.black),
                              ),
                            ),
                            1: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50),
                              child: Text(
                                'BSE',
                                style:
                                TextStyle(color: Colors.black),
                              ),
                            ),
                          },
                          groupValue: _sliding,
                          onValueChanged: (newValue) {
                            setState(() {
                              _sliding = newValue;
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Turnover',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Brokerage',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'STT Total',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Exchange Transaction Charge',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Clearing Charge',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'GST',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Stamp Duty',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Total Tax',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Points to Breakeven',
                      value: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 35, vertical: 0),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Net P&L",
                          style: TextStyle(
                              color: Colors.black, fontSize: 35),
                        ),
                        Text(
                          '100',
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 35,
                          ),
                        ),
                        // Text(
                        //   returnPL().toString(),
                        //   style: TextStyle(
                        //       color: returnPL() >= 0
                        //           ? Colors.greenAccent
                        //           : Colors.redAccent,
                        //       fontSize: sy(18)),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        });
  }
}
