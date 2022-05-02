import 'package:album/pages/image_view_page.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget(this.imageFile);

  var imageFile;

  void _handleImagePress(BuildContext context, var imageFile) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageViewPage(imageFile)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleImagePress(context, this.imageFile);
      },
      child: Card(
          child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            image: DecorationImage(
              image: Image.file(this.imageFile).image,
              fit: BoxFit.cover,
            )),
      )),
    );
  }
}
