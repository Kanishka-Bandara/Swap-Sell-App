import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TextComponents {
  static Widget h1(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
          // color: Theme.of(context).primaryColor,
          color: Colors.black87,
          fontWeight: FontWeight.w900,
          fontSize: 20),
    );
  }

  static Widget h3(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
          // color: Theme.of(context).primaryColor,
          color: Colors.black87,
          fontWeight: FontWeight.w900,
          fontSize: 20),
    );
  }

  static Widget paragraph(BuildContext context, String text) {
    // return Markdown(data: text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[Text(text)],
    );
  }
}
