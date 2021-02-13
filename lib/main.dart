import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inspection_app/commentpage.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/gallerypage.dart';
import 'package:inspection_app/dto/curbappealdto.dart';
import 'package:inspection_app/customratingwidget.dart';
import 'package:inspection_app/customcommentwidget.dart';
import 'package:inspection_app/dto/userdto.dart';
import 'package:inspection_app/dto/commentdto.dart';
import 'package:inspection_app/customdropdownwidget.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    title: 'Inspection',
    home: InspectionApp(),
  ));
}

CurbAppealDTO createTestCurbData() {

  CurbAppealDTO curbAppealDTO;

  UserDTO user = UserDTO("Hung Tran");
  user.email = "hungtran@123.com";
  user.photoId = NetworkImage("https://picsum.photos/id/237/200");

  curbAppealDTO = new CurbAppealDTO(user);
  String dummyText = "If you're looking for random paragraphs, you've come to the right place. When a random word or a random sentence isn't quite enough,"
      +" the next logical step is to find a random paragraph." +
      " We created the Random Paragraph Generator with you in mind. The process is quite simple. Choose the number of random paragraphs"
      +" you'd like to see and click the button. Your chosen number of paragraphs will instantly appear."
      + "While it may not be obvious to eve";

  curbAppealDTO.comment.content = dummyText;

  CommentDTO comment = new CommentDTO(user);
  comment.content = dummyText;

  CommentDTO comment1 = new CommentDTO(user);
  comment1.content = "Dummy";

  curbAppealDTO.photos.add(new PhotoDTO(1, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), comment, false));
  curbAppealDTO.photos.add(new PhotoDTO(2, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), comment1, false));
  curbAppealDTO.photos.add(new PhotoDTO(3, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), comment1, false));
  curbAppealDTO.photos.add(new PhotoDTO(4, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), comment1, false));
  curbAppealDTO.photos.add(new PhotoDTO(5, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), comment1, false));
  curbAppealDTO.photos.add(new PhotoDTO(6, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), comment1, false));
  curbAppealDTO.photos.add(new PhotoDTO(7, NetworkImage("https://picsum.photos/id/${Random().nextInt(100)}/500"), comment1, false));

  return curbAppealDTO;
}

class InspectionApp extends StatefulWidget{

  CurbAppealDTO _curbAppeal;
  InspectionApp() {
    _curbAppeal = createTestCurbData();
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
                        style: TextStyle(fontSize: 25),
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
                        style: TextStyle(fontFamily: 'RobotoMono', fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,)
                  ),
                ),


                //******************************************** Rating Section **************************************************************
                CustomRatingWidget(widget._curbAppeal),

                //******************************************** Trend Section **************************************************************

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: CustomDropDown(widget._curbAppeal.trend),
                ),

                //******************************************** Trend Section **************************************************************
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomCommentWidget("Comment: ", widget._curbAppeal.comment),
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
