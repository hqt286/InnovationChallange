
import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'package:inspection_app/commentpage.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/gallerypage.dart';
import 'package:inspection_app/dto/curbappealdto.dart';
import 'package:inspection_app/customratingwidget.dart';
import 'package:inspection_app/customcommentwidget.dart';
import 'package:inspection_app/dto/userdto.dart';
import 'package:inspection_app/dto/commentdto.dart';
import 'package:inspection_app/customdropdownwidget.dart';
import 'package:inspection_app/customgallerywidget.dart';
import 'package:inspection_app/customdialogwidget.dart';
import 'package:flutter/material.dart';

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

  PhotoDTO photoDTO = PhotoDTO.networkImage(1, NetworkImage("https://picsum.photos/id/63/500"), comment);
  photoDTO.address = "Falls Church, 22042, United States";
  curbAppealDTO.photos.add(photoDTO);
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

  void validatedButtonPressed() {
    if (widget._curbAppeal.comment.content.isEmpty) {
      widget._curbAppeal.passValidation = false;
      showDialog(context: context, builder:(BuildContext context) =>
          CustomDialogWidget("Opsss!", "You forgot to drop some comments", "Okay"));
    }
    else {
      widget._curbAppeal.passValidation = true;
    }
    setState(() {

    });
  }

  void galleryButtonPressed() async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery(widget._curbAppeal.photos)));
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {

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
                          color: widget._curbAppeal.passValidation ? Colors.greenAccent.withOpacity(0.7) : Colors.black,
                          onPressed: validatedButtonPressed,
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


                SizedBox(
                  height: 100,
                ),

                //******************************************** Rating Section **************************************************************
                CustomRatingWidget(widget._curbAppeal),
                SizedBox(
                  height: 100,
                ),

                //******************************************** Trend Section **************************************************************

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: CustomDropDown(widget._curbAppeal.trend),
                ),
                SizedBox(
                  height: 100,
                ),

                //******************************************** Comment Section **************************************************************
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: InkWell(
                      child: CustomCommentWidget(widget._curbAppeal.comment),
                      onTap: (){
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                      },
                    )
                ),

                SizedBox(

                  height: 100,
                ),

                //******************************************** Gallery Section **************************************************************
                InkWell(
                  onTap: galleryButtonPressed,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child:  CustomGalleryWidget(widget._curbAppeal.photos),
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}
