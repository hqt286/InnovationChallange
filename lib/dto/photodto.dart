import 'package:flutter/material.dart';

class PhotoDTO {

  int _photoId;
  Image _image;
  String _comment;

  PhotoDTO(this._photoId, this._image, this._comment);

  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  Image get image => _image;

  set image(Image value) {
    _image = value;
  }

  int get photoId => _photoId;

  set photoId(int value) {
    _photoId = value;
  }
}
