
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/300'),
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
                    child: Align(
                      child: InkWell(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                )
                            ),
                            child: Container(
                              width: 320,
                              height: 100,
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

          ],
        ),
      ),
    );
  }
}
