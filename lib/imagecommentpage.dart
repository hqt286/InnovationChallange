
import 'package:flutter/material.dart';
import 'package:inspection_app/commentpage.dart';
import 'package:inspection_app/dto/photodto.dart';

class ImageCommentPage extends StatefulWidget {

  PhotoDTO _photoDTO;

  ImageCommentPage(this._photoDTO);

  PhotoDTO get photoDTO => _photoDTO;

  set photoDTO(PhotoDTO value) {
    _photoDTO = value;
  }

  @override
  createState() => new ImageCommentPageState();
}

class ImageCommentPageState extends State<ImageCommentPage> {

  void commentButtonPressed() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage(widget.photoDTO.comment)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Photos",
          style: TextStyle(color: Color(0xffb74093).withOpacity(0.8), fontSize: 35),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget._photoDTO.image,
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      child: Text("Comment",
                        style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      child: InkWell(
                        child: Container(
                            child: Text(widget._photoDTO.comment,
                              style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
                            ),
                        ),
                        onTap: commentButtonPressed,
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
