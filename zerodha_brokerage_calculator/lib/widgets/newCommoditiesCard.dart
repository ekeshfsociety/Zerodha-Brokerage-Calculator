import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresCommodities.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresCurrency.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsCommodities.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsCurrency.dart';
import 'displayText.dart';

class CommoditiesCard extends StatefulWidget {
  final Key key;
  final String name;
  final bool isFutures;

  CommoditiesCard({this.key, this.name, this.isFutures});

  @override
  _CommoditiesCardState createState() => _CommoditiesCardState();
}

class _CommoditiesCardState extends State<CommoditiesCard> {
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

  String futureCommodityChoose, optionsCommodityChoose;

  List commodityFutures = [
    'ALUMINIUM',
    'CARDAMOM',
    'CASTORSEED',
    'COPPER',
    'COTTON',
    'CPO',
    'CRUDEOIL',
    'GOLD',
    'GOLDGUINEA',
    'GOLDM',
    'GOLDPETAL',
    'KAPAS',
    'LEAD',
    'MCXBULLDEX',
    'MCXMETLDEX',
    'MENTHOIL',
    'NATURALGAS',
    'NICKEL',
    'PEPPER',
    'RBDPMOLEIN',
    'RUBBER',
    'SILVER',
    'SILVERM',
    'SILVERMIC',
    'ZINC'
  ];
  List commodityOptions = ['COPPER', 'CRUDEOIL', 'GOLD', 'SILVER', 'ZINC'];

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
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 122,
                      child: DropdownButtonFormField(
                        value: (widget.key == Key('1'))
                            ? futureCommodityChoose
                            : optionsCommodityChoose,
                        onChanged: (newValue) {
                          setState(() {
                            (widget.key == Key('1'))
                                ? futureCommodityChoose
                                : optionsCommodityChoose = newValue;
                          });
                        },
                        items: (widget.key == Key('1'))
                            ? (commodityFutures.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList())
                            : commodityOptions.map((valueItem) {
                                return DropdownMenuItem(
                                    value: valueItem, child: Text(valueItem));
                              }).toList(),
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
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            gapPadding: 2,
                          ),
                          labelText: 'COMMODITY',
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        !(widget.key == Key('1'))
                            ? Container(
                                width: 88,
                                child: TextFormField(
                                  keyboardType: TextInputType.numberWithOptions(
                                      decimal: true),
                                  inputFormatters: [
                                    new FilteringTextInputFormatter.allow(
                                        RegExp(r"[0-9.]")),
                                  ],
                                  controller: _strikePrice,
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
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                      gapPadding: 2,
                                    ),
                                    labelText: 'STRIKE PRICE',
                                    labelStyle: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            : Container(),
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
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                gapPadding: 2,
                              ),
                              labelText: 'BUY',
                              labelStyle: TextStyle(color: Colors.black),
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
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                gapPadding: 2,
                              ),
                              labelText: 'SELL',
                              labelStyle: TextStyle(color: Colors.black),
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
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                                gapPadding: 2,
                              ),
                              labelText: 'QUANTITY',
                              labelStyle: TextStyle(color: Colors.black),
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
                              padding: EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                'NSE',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            1: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50),
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                        name: "Turnover",
                        value: (widget.key == Key('1'))
                            ? FuturesCommodities.turnover(
                                buy, quantity, sell, futureCommodityChoose)
                            : OptionsCommodities.turnover(buy, quantity, sell,
                                optionsCommodityChoose, strikePrice)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                        name: "Brokerage",
                        value: (widget.key == Key('1'))
                            ? FuturesCommodities.brokerage(
                                buy, quantity, sell, futureCommodityChoose)
                            : OptionsCommodities.brokerage(buy, quantity, sell,
                                optionsCommodityChoose, strikePrice)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Exchange Transaction Charge',
                      value: (widget.key == Key('1'))
                          ? FuturesCommodities.transactionCharges(
                              buy, quantity, sell, futureCommodityChoose)
                          : OptionsCommodities.exchangeCharge(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Clearing Charge',
                      value: (widget.key == Key('1'))
                          ? FuturesCommodities.ClearingCharge()
                          : OptionsCommodities.ClearingCharge(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'GST',
                      value: (widget.key == Key('1'))
                          ? FuturesCommodities.gst(
                              buy, quantity, sell, futureCommodityChoose)
                          : OptionsCommodities.gst(buy, quantity, sell,
                              optionsCommodityChoose, strikePrice),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'SEBI charges',
                      value: (widget.key == Key('1'))
                          ? FuturesCommodities.sebiCharges(
                              buy, quantity, sell, futureCommodityChoose)
                          : OptionsCommodities.sebiCharges(buy, quantity, sell,
                              optionsCommodityChoose, strikePrice),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Stamp Duty',
                      value: (widget.key == Key('1'))
                          ? FuturesCommodities.stampCharges(
                              buy, quantity, sell, futureCommodityChoose)
                          : OptionsCommodities.stampCharges(buy, quantity, sell,
                              optionsCommodityChoose, strikePrice),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Total Tax',
                      value: (widget.key == Key('1'))
                          ? FuturesCommodities.totalTaxes(
                              buy, quantity, sell, futureCommodityChoose)
                          : OptionsCommodities.totalTaxes(buy, quantity, sell,
                              optionsCommodityChoose, strikePrice),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextCards(
                      name: 'Points to Breakeven',
                      value: (widget.key == Key('1'))
                          ? FuturesCommodities.pointsToBreakeven(
                              buy, quantity, sell, futureCommodityChoose)
                          : OptionsCommodities.pointsToBreakeven(buy, quantity,
                              sell, optionsCommodityChoose, strikePrice),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Net P&L",
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                        Text(
                          ((widget.key == Key('1'))
                                  ? FuturesCommodities.netProfit(buy, quantity,
                                      sell, futureCommodityChoose)
                                  : OptionsCommodities.netProfit(
                                      buy,
                                      quantity,
                                      sell,
                                      optionsCommodityChoose,
                                      strikePrice))
                              .toString(),
                          style: TextStyle(
                              color: (widget.isFutures
                                          ? FuturesCommodities.netProfit(
                                              buy,
                                              quantity,
                                              sell,
                                              futureCommodityChoose)
                                          : OptionsCommodities.netProfit(
                                              buy,
                                              quantity,
                                              sell,
                                              optionsCommodityChoose,
                                              strikePrice)) >=
                                      0
                                  ? Colors.greenAccent
                                  : Colors.redAccent,
                              fontSize: sy(18)),
                        ),
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