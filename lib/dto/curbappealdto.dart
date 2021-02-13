import 'package:flutter/material.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'package:inspection_app/dto/commentdto.dart';
import 'package:inspection_app/dto/userdto.dart';
import 'dart:ui';

class CurbAppealDTO {
  double _rating;
  String _trend;
  CommentDTO _comment;
  List<PhotoDTO> _photos;
  Color _ratingColor;
  IconData _ratingIcon;
  String _ratingLabel;
  UserDTO _user;

  CurbAppealDTO(UserDTO user) {
    this._rating = 4;
    this._trend = "Unknown";
    this._photos = [];
    this._ratingColor = Colors.pinkAccent.withOpacity(0.5);
    this._ratingLabel = "Not Applicable";
    this._ratingIcon = Icons.sentiment_satisfied;
    this._user = user;
    this._comment = CommentDTO(user);
  }

  Color get ratingColor => _ratingColor;

  set ratingColor(Color value) {
    _ratingColor = value;
  }

  List<PhotoDTO> get photos => _photos;

  set photos(List<PhotoDTO> value) {
    _photos = value;
  }

  CommentDTO get comment => _comment;

  set comment(CommentDTO value) {
    _comment = value;
  }

  String get trend => _trend;

  set trend(String value) {
    _trend = value;
  }

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
    if (value == 0.0) {
      _ratingColor = Colors.redAccent.withOpacity(0.8);
      _ratingIcon = Icons.sentiment_dissatisfied_sharp;
      _ratingLabel = "1";
    }
    else if (value == 1.0) {
      _ratingColor = Colors.redAccent.withOpacity(0.5);
      _ratingIcon = Icons.sentiment_dissatisfied;
      _ratingLabel = "2";
    }
    else if (value == 2.0) {
      _ratingColor = Colors.blueAccent.withOpacity(0.5);
      _ratingIcon = Icons.sentiment_satisfied;
      _ratingLabel = "3";
    }
    else if (value == 3.0) {
      _ratingColor = Colors.blueAccent.withOpacity(0.7);
      _ratingIcon = Icons.sentiment_satisfied_alt;
      _ratingLabel = "4";
    }
    else if (value == 4.0) {
      _ratingColor = Colors.blueAccent;
      _ratingIcon = Icons.sentiment_very_satisfied_sharp;
      _ratingLabel = "5";
    }
    else if (value == 5.0) {
      _ratingColor = Colors.pinkAccent.withOpacity(0.5);
      _ratingIcon = Icons.sentiment_satisfied;
      _ratingLabel = "Not Applicable";
    }
    else if (value == 6.0) {
      _ratingColor = Colors.pinkAccent.withOpacity(0.5);
      _ratingIcon = Icons.sentiment_satisfied;
      _ratingLabel = "Not Accessible";
    }
  }

  String get ratingLabel => _ratingLabel;

  set ratingLabel(String value) {
    _ratingLabel = value;
  }

  IconData get ratingIcon => _ratingIcon;

  set ratingIcon(IconData value) {
    _ratingIcon = value;
  }

  UserDTO get user => _user;

  set user(UserDTO value) {
    _user = value;
  }
}
