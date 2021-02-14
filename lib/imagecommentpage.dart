import 'package:flutter/material.dart';
import 'package:inspection_app/commentpage.dart';
import 'package:inspection_app/dto/photodto.dart';

class ImageCommentPage extends StatefulWidget {

  PhotoDTO _photoDTO;

  ImageCommentPage(this._photoDTO);

  PhotoDTO get photoDTO => _photoDTO;

  set photoDTO(PhotoDTO value) {
    _photoDTO = value;
  }

  @override
  createState() => new ImageCommentPageState();
}

class ImageCommentPageState extends State<ImageCommentPage> {

  TextEditingController _textEditingController;

  void commentButtonPressed() {
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CommentPage(widget.photoDTO.comment)));
    });
  }

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget._photoDTO.comment.content);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Ink (
                    child: IconButton(
                      icon: Icon(IconData(61563, fontFamily: "MaterialIcons"), size: 25.0,),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context, 'Re-render');
                      },
                    ),
                  ),

                  Text("Photos",
                    style: TextStyle(fontSize: 25),
                  ),

                  Ink (
                    child: IconButton(
                      //Camera button
                      icon: Icon(IconData(0xe117, fontFamily: "MaterialIcons"), size: 25.0,),
                      color: Colors.black,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                      },
                    ),
                  ),
                ],
              ),
            )

        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget._photoDTO.image,
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Align(
                      child: Text("Comment",
                        style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 20),
                      ),
                    ),
                  ),


                  Container(
                    child: Padding (
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      child: Align(
                        alignment: Alignment.center,
                        child:
                        TextField(
                          maxLines: null,
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Text",
                          ),

                          onChanged: (value){
                            setState(() {
                              widget._photoDTO.comment.content = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
