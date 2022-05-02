import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
  var imageFile;

  ImageViewPage(this.imageFile);

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  var imageWidth;
  var imageHeight;

  void getImageSize() async {
    var decodedImage =
        await decodeImageFromList(this.widget.imageFile.readAsBytesSync());
    this.imageWidth = decodedImage.width;
    this.imageHeight = decodedImage.height;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getImageSize();
    var image = Image.file(widget.imageFile);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Full screen image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            new Image.file(
              this.widget.imageFile,
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Image width:",
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "${this.imageWidth}",
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "Image height:",
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "${this.imageHeight}",
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
