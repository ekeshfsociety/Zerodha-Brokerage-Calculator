import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/calculations/deliveryEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/intradayEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsEquity.dart';
import 'package:zerodha_brokerage_calculator/widgets/displayText.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key key}) : super(key: key);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen>
    with TickerProviderStateMixin {
  var selectedValue = 0;
  double tabWidth = 0;
  TabController _tabController;
  int index = 0;
  TextEditingController _buy = new TextEditingController(text: "49.2525");
  TextEditingController _sell = new TextEditingController(text: "49.2725");
  TextEditingController _quantity = new TextEditingController(text: "1");
  TextEditingController _strikePrice = new TextEditingController(text: "60.75");
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
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Center(
              child: Text(
                "Currency",
                style: TextStyle(fontSize: sy(20), color: Colors.blue),
              ),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  height: sy(38),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: sx(1), color: Colors.grey),
                    ),
                  ),
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: sx(10)),
                      labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: sx(5), color: Colors.lightBlue.shade900),
                        ),
                      ),
                      tabs: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: sx(12)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: sy(5)),
                            //width: 140,
                            child: Text(
                              "Futures",
                              style: TextStyle(
                                  color: Colors.black,
                                  // color: _tabController.index == 0
                                  //     ? Colors.blue
                                  //     : Colors.black,
                                  fontSize: sy(18)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: sx(15)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: sy(5)),
                            //width: 140,
                            child: Text(
                              "Options",
                              style: TextStyle(
                                  fontSize: sy(18), color: Colors.black),
                            ),
                          ),
                        ),
                      ]),
                ),
                Expanded(child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 80,
                              color: Color(0xFFF1F1F1),
                              child: Center(
                                child: Text(
                                  'Currency Futures',
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
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 80,
                              color: Color(0xFFF1F1F1),
                              child: Center(
                                child: Text(
                                  'Currency Options',
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
                                        labelText: 'STRIKE PRICE',
                                        labelStyle:
                                        TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
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
                    ),
                  ],
                ),),
              ],
            ),
          ),
        ),
      );
    });
  }
}
