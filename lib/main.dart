import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:inspection_app/commentpage.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/gallerypage.dart';
import 'package:inspection_app/dto/curbappealdto.dart';
import 'package:inspection_app/ratingwidget.dart';
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Ink (
                        child: IconButton(
                          icon: Icon(Icons.menu, size: 25.0,),
                          color: Colors.black,
                          onPressed: () {
                            // Navigator.of(context).pop();
                          },
                        ),
                      ),

                      Text("Curb Appeal",
                        style: TextStyle(fontSize: 20),
                      ),
                      Ink (
                        child: IconButton(
                          icon: Icon(IconData(61707, fontFamily: "MaterialIcons"), size: 25.0,),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),

          body: SingleChildScrollView (
            child: Column(
              children: [
                Container(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
                      child: Text("Comparison to Neighborhood; First Impression / Appearance",
                        style: TextStyle(fontFamily: 'RobotoMono', fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.center,)
                  ),
                ),

                //******************************************** Rating Section **************************************************************
                CustomRatingWidget(widget._curbAppeal),

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
