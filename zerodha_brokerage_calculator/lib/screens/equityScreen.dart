import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/widgets/newEquitiesCard.dart';

class EquityScreen extends StatefulWidget {
  EquityScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EquityScreenState();
}

class EquityScreenState extends State<EquityScreen>
    with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
            elevation: 0,
            centerTitle: true,
            title: Center(
                child: Text(
              "Equities",
              style: TextStyle(fontSize: sy(20), color: Colors.blue),
            )),
            actions: [
              // Image(image: AssetImage("assets/icons/settings-dark.svg")),
              Icon(Icons.settings, color: Colors.white),
              Icon(Icons.eleven_mp, color: Colors.transparent)
            ],
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              "Intraday",
                              style: TextStyle(
                                  color: _tabController.index == 0
                                      ? Colors.blue
                                      : Colors.black,
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
                              "Delivery",
                              style: TextStyle(
                                  fontSize: sy(18),
                                color: _tabController.index == 1
                                    ? Colors.blue
                                    : Colors.black,),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: sx(10)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: sy(5)),
                            //width: 140,
                            child: Text(
                              "Futures",
                              style: TextStyle(
                                  fontSize: sy(18),
                                color: _tabController.index == 2
                                    ? Colors.blue
                                    : Colors.black,),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: sx(10)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: sy(5)),
                            //width: 140,
                            child: Text(
                              "Options",
                              style: TextStyle(
                                  fontSize: sy(18),
                                color: _tabController.index == 3
                                    ? Colors.blue
                                    : Colors.black,),
                            ),
                          ),
                        ),
                      ]),
                ),
                //Divider(color: Colors.grey,thickness: 1,),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      EquitiesCard(key: Key("1"),name: "Intraday Equity",),
                      EquitiesCard(key: Key("2"),name: "Delivery Equity",),
                      EquitiesCard(key: Key("3"),name: "F&O - Futures",),
                      EquitiesCard(key: Key("4"),name: "F&O - Options",),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
