import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inspection_app/commentpage.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/gallerypage.dart';
import 'package:inspection_app/dto/curbappealdto.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: 'Inspection',
    home: InspectionApp(),
  ));
}

class InspectionApp extends StatefulWidget{

  CurbAppealDTO _curbAppeal = new CurbAppealDTO();
  InspectionApp() {
    _curbAppeal = new CurbAppealDTO();
    _curbAppeal.photos.add(new PhotoDTO(1, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), "If you're looking for random paragraphs, you've come to the right place. When a random word or a random sentence isn't quite enough, the next logical step is to find a random paragraph. We created the Random Paragraph Generator with you in mind. The process is quite simple. Choose the number of random paragraphs"
        +" you'd like to see and click the button. Your chosen number of paragraphs will instantly appear."
        + "While it may not be obvious to eve", false));
    _curbAppeal.photos.add(new PhotoDTO(2, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), "Hello", false));
    _curbAppeal.photos.add(new PhotoDTO(3, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), "Hello", false));
    _curbAppeal.photos.add(new PhotoDTO(4, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), "Hello", false));
    _curbAppeal.photos.add(new PhotoDTO(5, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), "Hello", false));
    _curbAppeal.photos.add(new PhotoDTO(6, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), "Hello", false));
    _curbAppeal.photos.add(new PhotoDTO(7, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), "Hello", false));
  }

  CurbAppealDTO get curbAppeal => _curbAppeal;

  set curbAppeal(CurbAppealDTO value) {
    _curbAppeal = value;
  }

  @override
  State<StatefulWidget> createState() => InspectionAppState();
}

class InspectionAppState extends State<InspectionApp> {


  void commentButtonPressed() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage(widget._curbAppeal.comment)));
    });
  }

  void galleryButtonPressed() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery(widget._curbAppeal.photos)));
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
              mainAxisAlignment: MainAxisAlignment.center,
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
                            "Your Rating: $widget",
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
                              value: widget._curbAppeal.rating,
                              activeColor: widget._curbAppeal.ratingColor,
                              inactiveColor: Colors.lightBlue,
                              label: "${widget._curbAppeal.rating}",
                              onChanged: (newValue) {
                                setState(() {
                                  widget._curbAppeal.rating = newValue;
                                  print(Text("${widget._curbAppeal.rating}"));
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
                                onTap: galleryButtonPressed,
                              ),

                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.blue,
                                ),
                                onTap: galleryButtonPressed,
                              ),
                              InkWell(
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.blue,
                                ),
                                onTap: galleryButtonPressed,
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
