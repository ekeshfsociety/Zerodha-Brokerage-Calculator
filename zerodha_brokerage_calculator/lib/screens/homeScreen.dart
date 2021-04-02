import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _search = new TextEditingController();
  final List<int> itemList = List.generate(10, (index) => (index + 1));

  @override
  void dispose() {
    super.dispose();
    _search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: sy(10)),
                    Row(children: [
                      SizedBox(
                        width: sx(20),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "Hello\n",
                          children: [
                            TextSpan(
                                text: "Foobar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sy(18),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: sy(18),
                                    fontWeight: FontWeight.w400))
                          ],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: sy(16),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ]),
                    SizedBox(height: sy(15)),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        width: sx(350),
                        child: TextField(
                          style: TextStyle(fontSize: sy(13)),
                          controller: _search,
                          decoration: InputDecoration(
                            hintText: "start searching...",
                            hintStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(sy(30))),
                              borderSide:
                              BorderSide(color: Colors.white, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(sy(30))),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: sx(5)),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: sy(23),
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                    Column(
                      children: [
                        Container(
                          height: sy(100),
                          padding: EdgeInsets.only(left: sx(20), top: sy(20)),
                          child: Container()
                        )
                      ],
                    ),
                    SizedBox(height: sy(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Explore from you favorite genres",
                          style:
                          TextStyle(color: Colors.white, fontSize: sy(14)),
                        )
                      ],
                    ),
                    SizedBox(height: sy(10)),
                    Container()
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
