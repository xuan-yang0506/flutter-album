import 'dart:io';

import 'package:album/image_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_from_gallery.dart';
import 'package:album/selectedImage.dart' as selectedImage;

enum ImageSourceType { gallery, camera }

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ImageFromGalleryPage(type, update)));
  }

  var photoWidgets;

  @override
  void initState() {
    super.initState();
    this.photoWidgets = <Widget>[];
  }

  void update() {
    if (selectedImage.selectedImage.imageFile != null) {
      setState(() {
        photoWidgets.add(ImageWidget(selectedImage.selectedImage.imageFile));
      });
    }
    selectedImage.selectedImage.imageFile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("571 Album"),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: photoWidgets.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return photoWidgets[index];
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150,
                  height: 40,
                  child: MaterialButton(
                    color: Colors.blue,
                    child: const Text(
                      "Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      _handleURLButtonPress(context, ImageSourceType.gallery);
                    },
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 40,
                  child: MaterialButton(
                    color: Colors.blue,
                    child: const Text(
                      "Camera",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _handleURLButtonPress(context, ImageSourceType.camera);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
