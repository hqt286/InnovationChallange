
import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspection_app/dto/commentdto.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/dto/userdto.dart';
import 'package:inspection_app/imagecommentpage.dart';
import 'package:geolocator/geolocator.dart';


class Gallery extends StatefulWidget {
  List<PhotoDTO> _photos;

  Gallery(this._photos);

  List<PhotoDTO> get photos => _photos;

  File _imageFile;

  set photos(List<PhotoDTO> value) {
    _photos = value;
  }

  @override
  createState() => new GalleryState();
}

class GalleryState extends State<Gallery>{

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {

    Future<void> openCamera(BuildContext context) async{
      var picture = await ImagePicker.pickImage(source: ImageSource.camera);
      this.setState(() {
        if (picture != null) {
          widget._imageFile = picture;
          PhotoDTO photo = PhotoDTO.fileImage(widget._photos.length, picture, CommentDTO(UserDTO("Hung Tran")));
          photo.address = _currentAddress;
          print(_currentAddress);
          widget._photos.add(photo);
        }
      });
    }

    Future<void> openLibrary(BuildContext context) async{
      var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
      this.setState(() {
        widget._imageFile = picture;
      });
    }


    String cutText(String text) {
      if (text.length > 100) {
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
                          Navigator.pop(context);
                        },
                      ),
                    ),

                    Text("Photos",
                      style: TextStyle(fontSize: 25),
                    ),

                    Ink (
                      child: IconButton(
                        //Camera button
                        icon: Icon(IconData(0xe014, fontFamily: "MaterialIcons"), size: 25.0,),
                        color: Colors.black,
                        onPressed: (){
                          openCamera(context);
                        },
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
                onTap: () async{
                  await Navigator.push(context, MaterialPageRoute(builder: (context) => ImageCommentPage(widget.photos[index])));
                  setState(() {

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
                            colorFilter: widget._photos[index].importantFlag ? ColorFilter.mode(Colors.red, BlendMode.color) : null,
                            image: widget._photos[index].isNetworkImage ? widget.photos[index].networkImage
                                : FileImage(widget.photos[index].fileImage),
                            height: 240,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            left: 16,
                            child: Text(
                              widget._photos[index].address,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.all(16).copyWith(bottom: 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              cutText(widget._photos[index].comment.content),
                              style: TextStyle(fontSize: 16, color: widget._photos[index].importantFlag ? Colors.red : Colors.black),
                            ),
                          )

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
