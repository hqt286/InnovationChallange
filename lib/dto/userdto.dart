import 'package:flutter/material.dart';

class UserDTO {
  String _userName;
  NetworkImage _photoId;
  String _uid;
  String _email;
  String _fullName;

  UserDTO(this._userName);

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }

  NetworkImage get photoId => _photoId;

  set photoId(NetworkImage image) {
    _photoId = image;
  }

  String get uid => _uid;

  set uid(String value) {
    _uid = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get fullName => _fullName;

  set fullName(String value) {
    _fullName = value;
  }
}