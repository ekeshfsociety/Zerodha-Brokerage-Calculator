import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/widgets/newCurrencyCard.dart';

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
            title: Text(
              "Currency",
              style: TextStyle(fontSize: sy(20), color: Colors.blue),
            ),
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: sy(38),
                  width: double.infinity,
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
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CurrencyCard(
                          key: Key("1"),
                          name: "Currency Futures",
                          isFutures: true),
                      CurrencyCard(
                          key: Key("2"),
                          name: "Currency Options",
                          isFutures: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
