
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/imagecommentpage.dart';
import 'package:inspection_app/main.dart';



class Gallery extends StatefulWidget {
  List<PhotoDTO> _photos;

  Gallery(this._photos);

  List<PhotoDTO> get photos => _photos;

  set photos(List<PhotoDTO> value) {
    _photos = value;
  }

  @override
  createState() => new GalleryState();
}

class GalleryState extends State<Gallery>{
  @override
  Widget build(BuildContext context) {

    String cutText(String text) {
      if (text.length > 20) {
        return text.substring(0, 100) + " ...";
      }
      return text;
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric( horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ink (
                      child: IconButton(
                        icon: Icon(IconData(61563, fontFamily: "MaterialIcons"), size: 25.0,),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),

                    Text("Photos",
                      style: TextStyle(fontSize: 20),
                    ),

                    Ink (
                      child: IconButton(
                        icon: Icon(IconData(0xe014, fontFamily: "MaterialIcons"), size: 25.0,),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )

          ),
        ),
        body: ListView.builder(
          itemCount: widget.photos.length,
          itemBuilder: (itemCount, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ImageCommentPage(widget.photos[index])));
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    widget.photos[index].importantFlag ? widget.photos[index].importantFlag = false :
                    widget.photos[index].importantFlag = true;
                  });
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Ink.image(
                            colorFilter: widget._photos[index].importantFlag ? ColorFilter.mode(Colors.grey, BlendMode.hue) : null,
                            image: widget._photos[index].image,
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            left: 16,
                            child: Text(
                              "Photo Id: ${widget._photos[index].photoId}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(16).copyWith(bottom: 0),
                        child: Text(
                          cutText(widget._photos[index].comment.content),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            child: Text('Tap to edit or read more'),
                            onPressed: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                )
            );
          },
        )
    );

  }
}
