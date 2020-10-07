import 'dart:convert';
import 'dart:io';

class ImageController {
  static ImageController dfaultController = ImageController();

  String encodeImageToBase64(File f) {
    return base64Encode(f.readAsBytesSync());
  }
}
