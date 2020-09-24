import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scoped_model/scoped_model.dart';

class CameraController extends Model {
  int _openCameraState = 0;
  int _openGalleryState = 1;
  static CameraController defaultController = CameraController();

  Future<File> getImage(BuildContext context) async {
    int r = await openCameraDialog(context);
    if (r == _openCameraState) {
      return await _openCamera();
    } else if (r == _openGalleryState) {
      return await _openGallery();
    } else {
      return null;
    }
  }

  Future<int> openCameraDialog(BuildContext context) async {
    return await showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                onPressed: () async {
                  Navigator.pop(context, _openCameraState);
                },
                child: Text("Open Camera"),
              ),
              CupertinoButton(
                onPressed: () async {
                  Navigator.pop(context, _openGalleryState);
                },
                child: Text("Open Gallery"),
              ),
              CupertinoButton(
                onPressed: () async {
                  Navigator.pop(context, null);
                },
                child: Text("Cancel"),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<File> _openGallery() async {
    return await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  Future<File> _openCamera() async {
    return await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
  }
}
