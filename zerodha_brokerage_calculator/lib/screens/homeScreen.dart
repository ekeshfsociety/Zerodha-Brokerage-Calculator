import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zerodha_brokerage_calculator/screens/commoditiesScreen.dart';
import 'package:zerodha_brokerage_calculator/screens/currencyScreen.dart';
import 'package:zerodha_brokerage_calculator/screens/equityScreen.dart';
import 'package:zerodha_brokerage_calculator/widgets/category_card.dart';

class HomeScreen extends StatelessWidget {

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour > 6 && hour < 12) {
      return '\nGood Morning';
    }
    if (hour > 12 && hour < 17) {
      return '\nGood Afternoon';
    }
    return '\nGood Evening';
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              // Here the height of the container is 45% of our total height
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/images/backgroundhome.png"),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sx(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: sy(20)),
                    Text(
                      greeting(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: sx(50),
                          fontFamily: 'Cairo'),
                    ),
                    SizedBox(height: sy(15)),
                    Text(
                      'Happy Trading',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: sx(75),
                          fontFamily: 'Cairo'),
                    ),
                    SizedBox(
                      height: sy(40.0),
                    ),
                    Expanded(
                      child: StaggeredGridView.count(
                        crossAxisCount: 2,
                        // childAspectRatio: 0.85,
                        crossAxisSpacing: sx(20),
                        mainAxisSpacing: sy(20),
                        children: <Widget>[
                          Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(sy(12))),
                                depth: sy(8),
                                lightSource: LightSource.topLeft,
                                color: Colors.grey),
                            child: CategoryCard(
                              title: "Equity",
                              svgSrc: "assets/icons/equity.svg",
                              press: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                        new EquityScreen()));
                              },
                            ),
                          ),
                          Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(sy(12))),
                                depth: sy(8),
                                lightSource: LightSource.topLeft,
                                color: Colors.grey),
                            child: CategoryCard(
                              title: "Currency",
                              svgSrc: "assets/icons/exchange.svg",
                              press: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                        new CurrencyScreen()));
                              },
                            ),
                          ),
                          Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(sy(12))),
                                depth: sy(8),
                                lightSource: LightSource.topLeft,
                                color: Colors.grey),
                            child: CategoryCard(
                              title: "Commodities",
                              svgSrc: "assets/icons/commodity.svg",
                              press: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) =>
                                        new CommoditiesScreen()));
                              },
                            ),
                          ),
                        ],
                        staggeredTiles: [
                          StaggeredTile.extent(2, sy(145)),
                          StaggeredTile.extent(1, sy(145)),
                          StaggeredTile.extent(1, sy(145))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
