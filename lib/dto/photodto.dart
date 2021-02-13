import 'package:flutter/material.dart';

class PhotoDTO {

  int _photoId;
  NetworkImage _image;
  String _comment;
  bool _importantFlag;


  PhotoDTO(this._photoId, this._image, this._comment, this._importantFlag);

  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  NetworkImage get image => _image;

  set image(NetworkImage value) {
    _image = value;
  }

  int get photoId => _photoId;

  set photoId(int value) {
    _photoId = value;
  }

  bool get importantFlag => _importantFlag;

  set importantFlag(bool value) {
    _importantFlag = value;
  }
}
