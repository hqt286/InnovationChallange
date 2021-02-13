import 'package:inspection_app/dto/userdto.dart';

class CommentDTO {

  UserDTO _user;
  String _content;

  CommentDTO(UserDTO user) {
    _content = "";
    _user = user;
  }

  String get content => _content;

  set content(String value) {
    _content = value;
  }

  UserDTO get user => _user;

  set user(UserDTO value) {
    _user = value;
  }
}