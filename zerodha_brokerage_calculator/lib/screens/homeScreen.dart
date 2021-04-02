import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _search = new TextEditingController();
  final List<Widget> itemList = List.generate(
      3,
      (index) => Container(
            color: Colors.white,
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
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: sy(30)),
                child: Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                    ),
                    items: itemList,
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
