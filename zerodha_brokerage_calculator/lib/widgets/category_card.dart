import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zerodha_brokerage_calculator/constants.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;

  const CategoryCard({
    Key key,
    this.svgSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(sy(13)),
        child: Container(
          // padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(sy(13)),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 17,
                spreadRadius: -23,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: EdgeInsets.all(sy(20.0)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    SvgPicture.asset(
                      svgSrc,
                      width: sx(75),
                      height: sy(75),
                    ),
                    Spacer(),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: sx(20)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
