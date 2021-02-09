
import 'package:flutter/material.dart';

class CommentPage extends StatefulWidget {
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
      body: Text("Comment Page"),
    );
  }
}