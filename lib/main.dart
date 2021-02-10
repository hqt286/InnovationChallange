import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:inspection_app/ratingbar.dart';
import 'package:inspection_app/commentpage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Inspection',
    home: RatingBar(),
  ));
}


class RatingBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => RatingBarState();
}

class RatingBarState extends State<RatingBar> {

  var sliderValue = 0.0;
  Color feedBackColor = Colors.red;
  var comment = "Enter Comment";

  void commentButtonPressed() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage()));
    });
  }
  @override
  Widget build(BuildContext context) {

    IconButton commentBox = IconButton(
      iconSize: 100,
      icon: Icon(
          Icons.add_box_rounded,
          color: Colors.grey),
      onPressed: commentButtonPressed,
    );


    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Curb Appeal",
            style: TextStyle(color: Color(0xffb74093).withOpacity(0.8), fontSize: 35),),
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,

          ),
          body: Container (
            child: Column(
              children: [

                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("Comparison to Neighborhood; First Impression / Appearance",
                    style: TextStyle(fontFamily: 'RobotoMono'),
                    textAlign: TextAlign.center,)
                  ),
                ),

                //******************************************** Rating Bar Section **************************************************************
                Container(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child:Text(
                            "Your Rating: $sliderValue",
                            style: TextStyle(color: Colors.blue.withOpacity(0.8), fontSize: 15),
                          ),
                        ),

                        Container(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.red[700],
                              inactiveTrackColor: Colors.red[100],
                              trackShape: RoundedRectSliderTrackShape(),
                              trackHeight: 4.0,
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                              thumbColor: Colors.redAccent,
                              overlayColor: Colors.red.withAlpha(32),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                              tickMarkShape: RoundSliderTickMarkShape(),
                              activeTickMarkColor: Colors.red[700],
                              inactiveTickMarkColor: Colors.red[100],
                              valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                              valueIndicatorColor: Colors.redAccent,
                              valueIndicatorTextStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            child: Slider(
                              min: 0.0,
                              max: 5.0,
                              divisions: 5,
                              value: sliderValue,
                              activeColor: feedBackColor,
                              inactiveColor: Colors.lightBlue,
                              label: "$sliderValue",
                              onChanged: (newValue) {
                                setState(() {
                                  sliderValue = newValue;
                                  print(Text("$sliderValue"));
                                  if (sliderValue == 0.0) {
                                    feedBackColor = Colors.green;
                                  }
                                  else if (sliderValue == 1.0) {
                                    feedBackColor = Colors.black;
                                  }
                                  else if (sliderValue == 2.0) {
                                    feedBackColor = Colors.yellow;
                                  }
                                  else if (sliderValue == 3.0) {
                                    feedBackColor = Colors.blueGrey;
                                  }
                                  else if (sliderValue == 4.0) {
                                    feedBackColor = Colors.blue;
                                  }
                                });
                              },
                            ),
                          ),
                        ),

                      ],
                    )
                ),



                //******************************************** Trend Section **************************************************************
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Trend",
                            style: TextStyle(color: Colors.blue.withOpacity(0.8), fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        child: Align(
                          child: InkWell(
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 1,
                                    )
                                ),
                                child: Container(
                                  width: 350,
                                  height: 50,
                                  child: Text("___ 1 2 3 4"),
                                )
                            ),
                            onTap: commentButtonPressed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //******************************************** Comment Section **************************************************************
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Comment",
                            style: TextStyle(color: Colors.blue.withOpacity(0.8), fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        child: Align(
                          child: InkWell(
                            child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 1,
                                    )
                                ),
                                child: Container(
                                  width: 350,
                                  height: 50,
                                  child: Text("___ 1 2 3 4"),
                                )
                            ),
                            onTap: commentButtonPressed,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //******************************************** Gallery Section **************************************************************

                Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Photos",
                              style: TextStyle(color: Colors.blue.withOpacity(0.8), fontSize: 15),
                            ),
                          ),
                        ),


                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.blue,
                                ),
                                onTap: () {},
                              ),

                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.blue,
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.blue,
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),


              ],
            ),
          )
      ),
    );
  }
}
