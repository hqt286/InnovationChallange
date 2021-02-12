import 'package:flutter/material.dart';
import 'package:inspection_app/dto/photodto.dart';
import 'dart:ui';

class CurbAppealDTO {
  double _rating;
  String _trend;
  String _comment;
  List<PhotoDTO> _photos;
  Color _ratingColor;

  CurbAppealDTO() {
    this._rating = 0;
    this._trend = "";
    this._comment= "";
    this._photos = [];
    this._ratingColor = Colors.white;
  }

  Color get ratingColor => _ratingColor;

  set ratingColor(Color value) {
    _ratingColor = value;
  }

  List<PhotoDTO> get photos => _photos;

  set photos(List<PhotoDTO> value) {
    _photos = value;
  }

  String get comment => _comment;

  set comment(String value) {
    _comment = value;
  }

  String get trend => _trend;

  set trend(String value) {
    _trend = value;
  }

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
    _rating == 0.0 ? _ratingColor = Colors.green :
    _rating == 1.0 ? _ratingColor = Colors.black :
    _rating == 2.0 ? _ratingColor = Colors.yellow :
    _rating == 3.0 ? _ratingColor = Colors.blueGrey :
    _rating == 4.0 ? _ratingColor = Colors.blue :
    _ratingColor = Colors.pink;

  }
}
