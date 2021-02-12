
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
  String _comment;
  CommentPage(this._comment);

  String get comment => _comment;

  set comment(String value) {
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
      body: Text(widget._comment),
    );
  }
}