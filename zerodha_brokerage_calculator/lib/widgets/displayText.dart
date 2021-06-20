import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class TextCards extends StatelessWidget {
  final String name;
  final double value;
  TextCards({this.name, this.value});
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: sy(10)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sx(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.black, fontSize: sy(12)),
                  ),
                  Text(
                    value.toString(),
                    style: TextStyle(color: Colors.black, fontSize: sy(12)),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            )
          ],
        ),
      );
    });
  }
}
