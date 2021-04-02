import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/calculations/deliveryEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/intradayEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsEquity.dart';
import 'package:zerodha_brokerage_calculator/colors.dart';

import 'displayText.dart';

class Equities extends StatefulWidget {
  final Key key;
  final String name;
  Equities({this.key, this.name});
  @override
  _EquitiesState createState() => _EquitiesState();
}

class _EquitiesState extends State<Equities> {
  TextEditingController _buy = new TextEditingController(text: "1000");
  TextEditingController _sell = new TextEditingController(text: "1100");
  TextEditingController _quantity = new TextEditingController(text: "400");
  int index=0;
  List functions = [IntraDayEquity,DeliveryEquity,FuturesEquity,OptionsEquity];
  int _sliding = 0;
  double buy;
  double sell;
  int quantity;

  double returnTurnOver(){
    switch(index){
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

  double returnBrokerage(){
    switch(index){
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

  double returnSTT(){
    switch(index){
      case 0:
        return IntraDayEquity.stt(buy, sell, quantity);
      case 1:
        return DeliveryEquity.stt(buy, sell, quantity);
      case 2:
        return FuturesEquity.stt(sell, quantity);
      case 3:
        return OptionsEquity.stt(sell, quantity);
      default:
        return IntraDayEquity.stt(buy, sell, quantity);
    }
  }

  double returnTxnCharge(){
    switch(index){
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

  double returnClearCharge(){
    switch(index){
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

  @override
  void initState() {
    super.initState();
    switch(widget.name){
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
                        Container(
                          width: sy(60),
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
                          width: sy(60),
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
                          width: sy(60),
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
                        });
                      }),
                  SizedBox(
                    height: sy(10),
                  ),
                  TextCards(
                    name: "Turnover",
                    value: returnTurnOver()
                  ),
                  TextCards(
                    name: "Brokerage",
                    value: returnBrokerage(),
                  ),
                  TextCards(
                    name: "STT Total",
                    value: returnSTT(),
                  ),
                  TextCards(
                    name: "Exchange txn charge",
                    value: returnTxnCharge(),
                  ),
                  TextCards(
                    name: "Clearing charge",
                    value: returnClearCharge(),
                  ),
                  TextCards(
                    name: "GST",
                    value: 12.42,
                  ),
                  TextCards(
                    name: "SEBI charges",
                    value: 0.42,
                  ),
                  TextCards(
                    name: "Stamp Duty",
                    value: 12,
                  ),
                  TextCards(
                    name: "Total Tax",
                    value: 203.82,
                  ),
                  TextCards(
                    name: "Points to breakeven",
                    value: 0.51,
                  ),
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
                          "39796.18",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: sy(18)),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
