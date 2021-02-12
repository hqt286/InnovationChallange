import 'package:flutter/material.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/imagecommentpage.dart';
import 'dart:math';



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



  final List<NetworkImage> images = <NetworkImage>[
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
    NetworkImage("https://picsum.photos/id/${new Random().nextInt(100)}/120"),
  ];

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
        body: ListView.builder(
          itemCount: widget.photos.length,
          itemBuilder: (itemCount, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ImageCommentPage(widget._photos[index])));
              },
              child: Container(
                child: Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: images[index],
                              )
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text("Checking"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
    );

  }

}
