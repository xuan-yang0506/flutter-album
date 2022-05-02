import 'dart:io';

import 'package:album/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:album/selectedImage.dart' as selectedImage;

class ImageFromGalleryPage extends StatefulWidget {
  final type;
  final Function() notifyParent;
  ImageFromGalleryPage(this.type, @required this.notifyParent);

  @override
  State<ImageFromGalleryPage> createState() =>
      _ImageFromGalleryPageState(this.type, this.notifyParent);
}

class _ImageFromGalleryPageState extends State<ImageFromGalleryPage> {
  var _image;
  var imagePicker;
  var type;
  final Function() notifyParent;

  _ImageFromGalleryPageState(this.type, this.notifyParent);

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            selectedImage.selectedImage.imageFile = _image;
            notifyParent();
            Navigator.pop(context);
          },
        ),
        title: Text(type == ImageSourceType.camera
            ? "Image from Camera"
            : "Image from Gallery"),
      ),
      body: Column(children: <Widget>[
        SizedBox(
          height: 52,
        ),
        Center(
          child: GestureDetector(
            onTap: () async {
              var source = type == ImageSourceType.camera
                  ? ImageSource.camera
                  : ImageSource.gallery;
              XFile image = await imagePicker.pickImage(
                  source: source,
                  imageQuality: 50,
                  preferredCameraDevice: CameraDevice.rear);
              setState(() {
                _image = File(image.path);
              });
            },
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.red[200],
              ),
              child: _image != null
                  ? Image.file(
                      _image,
                      width: 200,
                      height: 200,
                    )
                  : Container(
                      decoration: BoxDecoration(color: Colors.red[200]),
                      width: 200,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        )
      ]),
    );
  }
}
