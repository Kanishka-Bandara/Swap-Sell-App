import 'package:flutter/material.dart';

class DefaultComponents {
  static Widget buildNoDetailsWidget(
      BuildContext context, IconData iconData, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
          ),
          Icon(
            iconData,
            size: 50,
            color: Colors.grey,
          ),
          Text(
            message,
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}