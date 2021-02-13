import 'package:flutter/material.dart';
import 'package:inspection_app/dto/commentdto.dart';

class PhotoDTO {

  int _photoId;
  NetworkImage _image;
  CommentDTO _comment;
  bool _importantFlag;

  PhotoDTO(this._photoId, this._image, this._comment, this._importantFlag);

  CommentDTO get comment => _comment;

  set comment(CommentDTO value) {
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
