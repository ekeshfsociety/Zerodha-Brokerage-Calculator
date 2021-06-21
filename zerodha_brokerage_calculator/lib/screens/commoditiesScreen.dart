import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/calculations/deliveryEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/futuresEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/intradayEquity.dart';
import 'package:zerodha_brokerage_calculator/calculations/optionsEquity.dart';
import 'package:zerodha_brokerage_calculator/widgets/displayText.dart';
import 'package:zerodha_brokerage_calculator/widgets/newCommoditiesCard.dart';

class CommoditiesScreen extends StatefulWidget {
  const CommoditiesScreen({Key key}) : super(key: key);

  @override
  _CommoditiesScreenState createState() => _CommoditiesScreenState();
}

class _CommoditiesScreenState extends State<CommoditiesScreen>
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
                  "Commodities",
                  style: TextStyle(fontSize: sy(20), color: Colors.blue),
                ),
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
                        CommoditiesCard(
                            key: Key("1"),
                            name: "Commodities Futures",
                            isFutures: true),
                        CommoditiesCard(
                            key: Key("2"),
                            name: "Commodities Options",
                            isFutures: false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
