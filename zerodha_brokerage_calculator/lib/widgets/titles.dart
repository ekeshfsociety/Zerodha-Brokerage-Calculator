import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class TitleText extends StatelessWidget {
  final String name;
  final bool selected;
  TitleText({this.name, this.selected,Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        width: sx(500),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(sy(10)),
          border: Border.all(color: selected ? Color(0xff003566) : Colors.white,width: 2.0)
        ),
        child: Center(
         child: Text(
            name,
           style: TextStyle(
             color: Colors.white,
             fontWeight: FontWeight.w600,
             fontSize: sy(19)
           ),
          )
        )
      );
    });
  }
}
