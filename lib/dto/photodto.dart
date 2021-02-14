import 'dart:io';

import 'package:flutter/material.dart';
import 'package:inspection_app/dto/commentdto.dart';

class PhotoDTO {

  int _photoId;
  NetworkImage _networkImage;
  File _fileImage;
  CommentDTO _comment;
  bool _importantFlag;
  bool _isNetworkImage;
  String _address;

  PhotoDTO.fileImage(int photoId, File fileImage, CommentDTO commentDTO) {
    _photoId = photoId;
    _comment = commentDTO;
    _fileImage = fileImage;
    _isNetworkImage = false;
    _networkImage = NetworkImage("");
    _importantFlag = false;
  }

  PhotoDTO.networkImage(int photoId, NetworkImage networkImage, CommentDTO commentDTO) {
    _photoId = photoId;
    _comment = commentDTO;
    _fileImage = null;
    _isNetworkImage = true;
    _networkImage = networkImage;
    _importantFlag = false;
  }


  PhotoDTO(int photoId, CommentDTO commentDTO) {
    _photoId = photoId;
    _networkImage = NetworkImage("");
    _fileImage = null;
    _comment = commentDTO;
    _importantFlag = false;
    _isNetworkImage = false;
  }

  CommentDTO get comment => _comment;

  set comment(CommentDTO value) {
    _comment = value;
  }

  NetworkImage get networkImage => _networkImage;

  set networkImage(NetworkImage value) {
    _isNetworkImage = true;
    _networkImage = value;
  }

  int get photoId => _photoId;

  set photoId(int value) {
    _photoId = value;
  }

  bool get importantFlag => _importantFlag;

  set importantFlag(bool value) {
    _importantFlag = value;
  }

  File get fileImage => _fileImage;

  set fileImage(File value) {
    _isNetworkImage = false;
    _fileImage = value;
  }

  bool get isNetworkImage => _isNetworkImage;

  set isNetworkImage(bool value) {
    _isNetworkImage = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }
}
