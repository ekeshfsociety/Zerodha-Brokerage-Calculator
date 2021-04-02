import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:zerodha_brokerage_calculator/colors.dart';

class Equities extends StatefulWidget {
  final Key key;
  final String name;
  Equities({this.key, this.name});
  @override
  _EquitiesState createState() => _EquitiesState();
}

class _EquitiesState extends State<Equities> {
  TextEditingController _buy = new TextEditingController(text: "1000");
  TextEditingController _sell = new TextEditingController(text: "1100");
  TextEditingController _quantity = new TextEditingController(text: "400");
  int _sliding =0 ;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
        key: widget.key,
        builder: (context, height, width, sy, sx) {
          return Container(
              width: sx(500),
              decoration: BoxDecoration(
                color: cardBackground,
                borderRadius: BorderRadius.circular(sy(10)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: sy(10)),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: sy(19)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: sy(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: sy(60),
                          child: TextFormField(
                            controller: _buy,
                            obscureText: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                focusColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 2,
                                ),
                                labelText: 'Buy',
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          width: sy(60),
                          child: TextFormField(
                            controller: _sell,
                            obscureText: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                focusColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 2,
                                ),
                                labelText: 'Sell',
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          width: sy(60),
                          child: TextFormField(
                            controller: _quantity,
                            obscureText: false,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  gapPadding: 2,
                                ),
                                labelText: 'Quantity',
                                labelStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CupertinoSlidingSegmentedControl(
                      thumbColor: backgroundColor,
                      children: {
                        0: Padding(
                          padding: EdgeInsets.symmetric(horizontal: sx(50)),
                          child: Text(
                            "NSE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        1: Padding(
                            padding: EdgeInsets.symmetric(horizontal: sx(50)),
                            child: Text(
                              'BSE',
                              style: TextStyle(color: Colors.white),
                            )),
                      },
                      groupValue: _sliding,
                      onValueChanged: (newValue) {
                        setState(() {
                          _sliding = newValue;
                        });
                      }),
                  SizedBox(height: sy(10),),
                  TextCards(name:"Turnover",value: 8400000,),
                  TextCards(name: "Brokerage",value: 40,),
                  TextCards(name: "STT Total",value: 110,),
                  TextCards(name: "Exchange txn charge",value: 28.98,),
                  TextCards(name: "Clearing charge",value: 0,),
                  TextCards(name: "GST",value: 12.42,),
                  TextCards(name: "SEBI charges",value: 0.42,),
                  TextCards(name: "Stamp Duty",value: 12,),
                  TextCards(name: "Total Tax", value: 203.82,),
                  TextCards(name: "Points to breakeven",value: 0.51,),
                  Padding(padding: EdgeInsets.symmetric(horizontal: sx(20)) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Net P&L",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sy(18)
                          ),
                        ),
                        Text(
                          "39796.18",
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: sy(18)
                          ),
                        ),
                      ],
                    ),),
                ],
              ));
        });
  }
}

class TextCards extends StatelessWidget{
  final String name;
  final double value;
  TextCards({this.name,this.value});
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: sy(10)),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: sx(20)) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sy(12)
                  ),
                ),
                Text(
                  value.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: sy(12)
                  ),
                ),
              ],
            ),),
          Divider(thickness: 0.5,color: Colors.white,)

        ],
      ),);
    }
    );
  }


}
