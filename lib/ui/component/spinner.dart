import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner {
  static getSpinner(BuildContext context, double size) {
    return SpinKitThreeBounce(
      color: Theme.of(context).primaryColor,
      size: size,
    );
  }
}
