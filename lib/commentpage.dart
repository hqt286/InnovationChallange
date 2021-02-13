
import 'package:flutter/material.dart';
import 'package:inspection_app/dto/commentdto.dart';

class CommentPage extends StatefulWidget {
   CommentDTO _comment;
  CommentPage(this._comment);


   CommentDTO get comment => _comment;

  set comment(CommentDTO value) {
    _comment = value;
  }

  @override
  createState() => new CommentPageState();
}

class CommentPageState extends State<CommentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: Text(widget._comment.content),
    );
  }
}