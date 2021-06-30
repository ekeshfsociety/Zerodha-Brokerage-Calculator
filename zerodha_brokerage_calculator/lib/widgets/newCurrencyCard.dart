import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresCurrency.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsCurrency.dart';
import 'displayText.dart';

class CurrencyCard extends StatefulWidget {
  final Key key;
  final String name;
  final bool isFutures;

  CurrencyCard({this.key, this.name, this.isFutures});

  @override
  _CurrencyCardState createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  TextEditingController _buy;
  TextEditingController _sell;
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
    _buy = new TextEditingController(
        text: (widget.isFutures) ? "49.2525" : "0.0625");
    _sell = new TextEditingController(
        text: (widget.isFutures) ? "49.2725" : "0.0675");
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
    final node = FocusScope.of(context);
    return RelativeBuilder(
        key: widget.key,
        builder: (context, height, width, sy, sx) {
          return SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: sy(50),
                    color: Color(0xFFF1F1F1),
                    child: Center(
                      child: Text(
                        widget.name,
                        style: GoogleFonts.lato(
                          fontSize: sy(25),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sy(15)),
                    child: !(widget.key == Key('1'))
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: sx(110),
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _strikePrice,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  obscureText: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(sy(10.0)),
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
                                          BorderRadius.circular(sy(10)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'STRIKE PRICE',
                                    labelStyle: TextStyle(color: Colors.black,fontSize: sy(10.1)),
                                  ),
                                ),
                              ),
                              Container(
                                width: sx(110),
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _buy,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  obscureText: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(sy(10.0)),
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
                                          BorderRadius.circular(sy(10)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'BUY',
                                    labelStyle: TextStyle(color: Colors.black,fontSize: sy(10.1)),
                                  ),
                                ),
                              ),
                              Container(
                                width: sx(110),
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _sell,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  obscureText: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(sy(10.0)),
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
                                          BorderRadius.circular(sy(10)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'SELL',
                                    labelStyle: TextStyle(color: Colors.black,fontSize: sy(10.1)),
                                  ),
                                ),
                              ),
                              Container(
                                width: sx(110),
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _quantity,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.unfocus(),
                                  obscureText: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(sy(10.0)),
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
                                          BorderRadius.circular(sy(10)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'QUANTITY',
                                    labelStyle: TextStyle(color: Colors.black,fontSize: sy(10.1)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: sx(115),
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _buy,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  obscureText: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(sy(10.0)),
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
                                          BorderRadius.circular(sy(10)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'BUY',
                                    labelStyle: TextStyle(color: Colors.black,fontSize: sy(11)),
                                  ),
                                ),
                              ),
                              Container(
                                width: sx(115),
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _sell,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.nextFocus(),
                                  obscureText: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(sy(10.0)),
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
                                          BorderRadius.circular(sy(10)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'SELL',
                                    labelStyle: TextStyle(color: Colors.black,fontSize: sy(11)),
                                  ),
                                ),
                              ),
                              Container(
                                width: sx(115),
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _quantity,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () => node.unfocus(),
                                  obscureText: false,
                                  style: TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(sy(10.0)),
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
                                          BorderRadius.circular(sy(10)),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'QUANTITY',
                                    labelStyle: TextStyle(color: Colors.black,fontSize: sy(11)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sy(17)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: sx(70)),
                      child: CupertinoSlidingSegmentedControl(
                          children: {
                            0: Padding(
                              padding: EdgeInsets.symmetric(horizontal: sx(50)),
                              child: Text(
                                'NSE',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            1: Padding(
                              padding: EdgeInsets.symmetric(horizontal: sx(50)),
                              child: Text(
                                'BSE',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          },
                          groupValue: _sliding,
                          onValueChanged: (newValue) {
                            setState(() {
                              _sliding = newValue;
                               (newValue == 0)
                                  ? (isNse = true)
                                  : (isNse = false);
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: sy(13)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sx(65), vertical: sy(0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Net P&L",
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                        Text(
                          ((widget.key == Key('1'))
                                  ? FuturesCurrency.netProfit(
                                      buy, quantity, sell, isNse)
                                  : OptionsCurrency.netProfit(
                                      buy, quantity, sell, strikePrice, isNse))
                              .toString(),
                          style: TextStyle(
                              color: (widget.isFutures
                                          ? FuturesCurrency.netProfit(
                                              buy, quantity, sell, isNse)
                                          : OptionsCurrency.netProfit(
                                              buy,
                                              quantity,
                                              sell,
                                              strikePrice,
                                              isNse)) >=
                                      0
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              fontSize: sy(20)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sy(10),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'Points to Breakeven',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.breakeven(
                              buy, quantity, sell, isNse)
                          : OptionsCurrency.breakeven(
                              buy, quantity, sell, strikePrice, isNse),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'Pips to breakeven',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.pipsToBreakEven(
                              buy, quantity, sell, isNse)
                          : OptionsCurrency.pipsToBreakeven(
                              buy, quantity, sell, strikePrice, isNse),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                        name: "Turnover",
                        value: (widget.key == Key('1'))
                            ? FuturesCurrency.turnover(buy, quantity, sell)
                            : OptionsCurrency.turnover(buy, quantity, sell)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                        name: "Brokerage",
                        value: (widget.key == Key('1'))
                            ? FuturesCurrency.brokerage(buy, quantity, sell)
                            : OptionsCurrency.brokerage(
                                buy, quantity, sell, strikePrice)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'Exchange Transaction Charge',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.transactionCharges(
                              buy, quantity, sell, isNse)
                          : OptionsCurrency.transactionCharges(
                              buy, quantity, sell, isNse),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'Clearing Charge',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.ClearingCharge()
                          : OptionsCurrency.ClearingCharge(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'GST',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.gst(buy, quantity, sell, isNse)
                          : OptionsCurrency.gst(
                              buy, quantity, sell, strikePrice, isNse),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'SEBI charges',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.sebiCharges(buy, quantity, sell)
                          : OptionsCurrency.sebiCharges(buy, quantity, sell),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'Stamp Duty',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.stampCharges(buy, quantity)
                          : OptionsCurrency.stampCharges(buy, quantity),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: sx(20)),
                    child: TextCards(
                      name: 'Total Tax',
                      value: (widget.key == Key('1'))
                          ? FuturesCurrency.totalTaxes(
                              buy, quantity, sell, isNse)
                          : OptionsCurrency.totalTaxes(
                              buy, quantity, sell, strikePrice, isNse),
                    ),
                  ),
                  SizedBox(height: sy(15)),
                ],
              ),
            ),
          );
        });
  }
}
