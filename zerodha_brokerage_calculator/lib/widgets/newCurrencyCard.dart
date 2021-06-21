import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                            controller: _quantity,
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
                        name: "Turnover",
                        value: widget.isFutures ? FuturesCurrency.turnover(buy, quantity, sell) : OptionsCurrency.turnover(buy, quantity, sell)),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                        name: "Brokerage",
                        value:
                        widget.isFutures ? FuturesCurrency.brokerage(buy, quantity, sell) : OptionsCurrency.brokerage(buy, quantity, sell, strikePrice)),
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
                      name: 'SEBI charges',
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
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Pips to breakeven',
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
