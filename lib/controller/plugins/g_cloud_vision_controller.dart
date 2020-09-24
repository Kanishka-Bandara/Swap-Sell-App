import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swap_sell/controller/appconfig/camera_controller.dart';

class GCloudVisionController {
  static GCloudVisionController defaultController = GCloudVisionController();

  Future<String> getKeyWord(BuildContext context) async {
    File image = await CameraController.defaultController.getImage(context);
    // if (image != null) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         content: Column(
    //           children: <Widget>[
    //             Image.file(image),
    //           ],
    //         ),
    //       );
    //     },
    //   );
    // }
    return image == null ? null : "Alisha";
  }
}
