import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/widgets/currecncyCard.dart';
import 'package:zerodha_brokerage_calculator/widgets/equitiesCard.dart';
import '../widgets/titles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _search = new TextEditingController();
  int _currentIndex = 0;
  int pageNum = 0;
  final List<Widget> itemList = List.generate(
      3,
      (index) => Container(
            color: Color(0xff001D3D),
            child: Center(
              child: Text((index + 1).toString()),
            ),
          ));

  List<Widget> item = [
    Equities(key: Key("1"), name: "Intraday Equity"),
    Equities(key: Key("2"), name: "Delivery Equity"),
    Equities(key: Key("3"), name: "F&O - Futures"),
    Equities(key: Key("4"), name: "F&O - Options")
  ];
  List<Widget> itemCurrency = [
    Currency(key: Key("1"), name: "Futures Currency", isFutures: true),
    Currency(key: Key("2"), name: "Options Currency", isFutures: false)
  ];
  List listDisplayed;

  @override
  void initState() {
    super.initState();
    listDisplayed = [item,itemCurrency,item];
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: Color(0xff000814),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: sy(60)),
                  child: Column(
                    children: [
                      Container(
                        height: sy(50),
                        width: double.infinity,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              scrollDirection: Axis.horizontal,
                              enableInfiniteScroll: false,
                              disableCenter: false,
                              autoPlay: false,
                              onPageChanged:
                                  (index, carouselPageChangedReason) {
                                setState(() {
                                  _currentIndex = index;
                                  if(_currentIndex == 1 && pageNum == 2){
                                    pageNum = 1;
                                  }
                                });
                              }),
                          items: [
                            TitleText(
                              name: "Equities - F&O",
                              selected: _currentIndex == 0,
                            ),
                            TitleText(
                              name: "Currency",
                              selected: _currentIndex == 1,
                            ),
                            TitleText(
                              name: "Commodities",
                              selected: _currentIndex == 2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: sy(10)),
                        child: Container(
                          child: CarouselSlider(
                              options: CarouselOptions(
                                height: sy(610),
                                enlargeCenterPage: true,
                                viewportFraction: 0.8,
                                initialPage: pageNum,
                                scrollDirection: Axis.horizontal,
                                enableInfiniteScroll: false,
                                disableCenter: true,
                                autoPlay: false,
                                onPageChanged: (num, carouselPageChangedReason){
                                  setState(() {
                                    pageNum = num;
                                  });
                                }
                              ),
                              items: listDisplayed[_currentIndex]),
                        ),
                      ),
                      SizedBox(
                        height: sy(10),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
