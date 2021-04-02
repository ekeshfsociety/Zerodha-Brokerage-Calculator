import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import '../widgets/titles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _search = new TextEditingController();
  int _currentIndex = 0;
  final List<Widget> itemList = List.generate(
      3,
      (index) => Container(
            color: Color(0xff001D3D),
            child: Center(
              child: Text((index + 1).toString()),
            ),
          ));

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: Color(0xff000814),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
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
                            onPageChanged: (index, carouselPageChangedReason) {
                              setState(() {
                                _currentIndex = index;
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
                    ),Container(
                      child: CarouselSlider(
                        options: CarouselOptions(
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                            viewportFraction: 0.8,
                            scrollDirection: Axis.horizontal,
                            enableInfiniteScroll: false,
                            disableCenter: false,
                            autoPlay: false,),
                        items: itemList
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
