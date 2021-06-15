import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class EquityScreen extends StatefulWidget {
  EquityScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => EquityScreenState();
}

class EquityScreenState extends State<EquityScreen>
    with TickerProviderStateMixin {
  GlobalKey key = GlobalKey();
  TabController _tabController ;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  var selectedValue = 0;
  double tabWidth = 0;
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Center(
                child: Text(
                  "Equities",
                  style: TextStyle(fontSize: sy(20),color: Colors.blue),
                )),
            actions: [
              // Image(image: AssetImage("assets/icons/settings-dark.svg")),
              Icon(Icons.settings, color: Colors.white),
              Icon(Icons.eleven_mp, color: Colors.transparent)
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  height: sy(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                          width: sx(1), color: Colors.grey),
                    ),
                  ),
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: sx(10)),
                      labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: sx(5), color: Colors.lightBlue.shade900),
                        ),
                      ),
                      tabs: [
                        Padding(padding: EdgeInsets.symmetric(horizontal: sx(12)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: sy(5)),
                            //width: 140,
                            child: Text(
                              "Stocks",
                              style: TextStyle(
                                  color: _tabController.index== 0 ?  Colors.blue :Colors.black,
                                  fontSize: sy(18)
                              ),
                            ),
                          ),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: sx(15)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom:sy(5)),
                            //width: 140,
                            child: Text(
                              "Mutual Funds",
                              style: TextStyle(
                                  fontSize: sy(18),
                                  color: Colors.black
                              ),
                            ),
                          ),),

                        Padding(padding: EdgeInsets.symmetric(horizontal: sx(10)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom: sy(5)),
                            //width: 140,
                            child: Text(
                              "Gold",
                              style: TextStyle(
                                  fontSize: sy(18),
                                  color: Colors.black
                              ),
                            ),
                          ),),
                        Padding(padding: EdgeInsets.symmetric(horizontal: sx(10)),
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(bottom:sy(5)),
                            //width: 140,
                            child: Text(
                              "F&O - Options",
                              style: TextStyle(
                                  fontSize: sy(18),
                                  color: Colors.black
                              ),
                            ),
                          ),),
                      ]),
                ),
                //Divider(color: Colors.grey,thickness: 1,),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(color: Colors.blue,),
                      Container(color: Colors.red,),
                      Container(color: Colors.orangeAccent,),
                      Container(color: Colors.greenAccent,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });;
  }
}