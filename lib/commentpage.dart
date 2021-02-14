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
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget._comment.content);
  }
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
      ),
      body: TextField(
        maxLines: null,
        controller: _textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Text",
        ),
        onChanged: (value){
          setState(() {
            widget._comment.content = value;
          });
        },
      ),
    );
  }
}