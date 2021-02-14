import 'package:flutter/material.dart';
import 'package:inspection_app/dto/commentdto.dart';

class CustomCommentWidget extends StatefulWidget {

  CommentDTO _comment;

  CommentDTO get comment => _comment;

  set comment(CommentDTO value) {
    _comment = value;
  }

  CustomCommentWidget(this._comment);

  @override
  createState() => CustomCommentWidgetState();
}

class CustomCommentWidgetState extends State <CustomCommentWidget> {

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Align(
            alignment: Alignment.center,
            child:Text(
              "Tell us what you think...",
              style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 20),
            ),
          ),
        ),

        Card(
          child: Column(
            children: [
              //***************************************** Header Section ******************
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 75,
                        height: 75,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(60/2),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: widget._comment.user.photoId
                            )
                        ),
                      ),

                      //***************************************** Body Section ******************
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                child: Text(widget._comment.user.userName,style: TextStyle(fontSize: 16),
                                )
                            ),
                            SizedBox(height: 5,
                            ),
                            Text(widget._comment.user.email,
                              style: TextStyle(color: Colors.grey, fontSize: 16),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Title (
                      color: Colors.blue,
                      child: Text("Tap To Edit...",
                        style: TextStyle(fontSize: 16, color: Colors.blueAccent.withOpacity(.5)),
                      ),
                    ),
                  ),
                ),
              ),

              //********************************* Text Section ****************

              Container(
                child: Padding (
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Container(
                        child: Text(widget._comment.content,
                          style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),

              ),



            ],
          ),
        ),
      ],

    );

  }
}