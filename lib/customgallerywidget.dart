import 'package:flutter/material.dart';
import 'package:inspection_app/dto/photodto.dart';

class CustomGalleryWidget extends StatefulWidget {

  List<PhotoDTO> _photos;

  List<PhotoDTO> get photos => _photos;

  set photos(List<PhotoDTO> value) {
    _photos = value;
  }

  CustomGalleryWidget(this._photos);

  @override
  createState() => CustomGalleryWidgetState();
}

class CustomGalleryWidgetState extends State<CustomGalleryWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: widget._photos.length == 0 ? NetworkImage("https://picsum.photos/id/237/500") : widget._photos[0].image,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  left: 16,
                  child: Text(
                    "How about couple photos?",
                    style: TextStyle(color: Colors.black, fontSize: 20, backgroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}