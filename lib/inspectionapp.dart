
import 'dart:ui';
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
import 'package:toast/toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:inspection_app/inspectionguideline.dart';

CurbAppealDTO createTestCurbData() {

  CurbAppealDTO curbAppealDTO;
  UserDTO user = UserDTO("Hung Tran");
  user.email = "hungtran@123.com";
  user.photoId = NetworkImage("https://www.irecsolarcareermap.org/assets/images-jobs/BuildingInspector.jpg");

  curbAppealDTO = new CurbAppealDTO(user);
  String dummyComment = """This property inspection report may include an inspection agreement (contract), addenda, and other
information related to property conditions. If any item or comment is unclear, you should ask the inspector
to clarify the findings. It is important that you carefully read ALL of this information.
This inspection is subject to the rules (“Rules”) of the Texas Real Estate Commission (“TREC”), which
can be found at www.trec.state.tx.us.
The TREC Standards of Practice (Sections 535.227-535.231 of the Rules) are the minimum standards for
inspections by TREC-licensed inspectors. An inspection addresses only those components and
conditions that are present, visible, and accessible at the time of the inspection. While there may be other
parts, components or systems present, only those items specifically noted as being inspected were
inspected. The inspector is not required to move furnishings or stored items. The inspection report may
address issues that are code-based or may refer to a particular code; however, this is NOT a code
compliance inspection and does NOT verify compliance with manufacturer’s installation instructions. The
inspection does NOT imply insurability or warrantability of the structure or its components. Although some
safety issues may be addressed in this report, this inspection is NOT a safety/code inspection, and the
inspector is NOT required to identify all potential hazards. """;

  String dummyImageComment = """There is some flaking paint and deterioration to the door frame and trim on the exterior side of the door. Recommend repairs to prevent future deterioration.
There is some missing and or damaged weather stripping on the door frame. """;
  curbAppealDTO.comment.content = dummyComment;
  CommentDTO comment = new CommentDTO(user);
  comment.content = dummyImageComment;

  PhotoDTO photoDTO = PhotoDTO.networkImage(1, NetworkImage("https://cdngeneral.rentcafe.com/dmslivecafe/3/317695/Exterior%20View%20of%20Oxmoor%20Apartments.jpg?crop=(0,20,300,200)&cropxunits=300&cropyunits=200&quality=85&scale=both&"), comment);
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


  Future<void> sendMail() async {
    String username = 'quochung181@gmail.com';
    String password = 'avmczfsoqcspulpe';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username)
      ..recipients.add('hqt286@vt.edu')
      ..subject = 'Inspection Result :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>Summary Of Inspection Report</h1>\n"
          + "<p>Overall Rating: ${widget._curbAppeal.ratingLabel}</p>\n"
          + "<p>Trend: ${widget._curbAppeal.trend} </p>\n"
          +"<p>Comment: ${widget._curbAppeal.comment.content}</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      Toast.show("You have clicked the Button! and email sent", context, duration: 3, gravity:  Toast.CENTER);
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  void validatedButtonPressed() {
    if (widget._curbAppeal.comment.content.isEmpty) {
      widget._curbAppeal.passValidation = false;
      showDialog(context: context, builder:(BuildContext context) =>
          CustomDialogWidget("Opsss!", "You forgot to drop some comments", "Okay"));
    }
    else {
      sendMail();
      widget._curbAppeal.passValidation = true;
      showDialog(context: context, builder:(BuildContext context) =>
          CustomDialogWidget("Awesome!", "Property summary email sent to Fannie Mae", "Okay"));
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

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Icon(IconData(0xe109, fontFamily: "MaterialIcons"), color: Colors.redAccent,),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InspectionGuideline()));
            },
          ),

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
                          icon: Icon(Icons.menu, size: 30.0,),
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
                          icon: Icon(IconData(0xebf1, fontFamily: "MaterialIcons"), size: 30.0,),
                          color: widget._curbAppeal.passValidation ? Colors.green : Colors.black,
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
