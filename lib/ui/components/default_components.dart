import 'package:flutter/material.dart';
import 'package:swap_sell/config/app_navigator.dart';

class DefaultComponents {
  static Widget buildNoDetailsWidget(
      BuildContext context, IconData iconData, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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

  static Widget buildUnSignedTile(BuildContext context, String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  child: Text("Sign up"),
                  onPressed: () {
                    AppNavigator.navigateToSignUpPage(context);
                  },
                ),
                RaisedButton(
                  child: Text("Sign in"),
                  onPressed: () {
                    AppNavigator.navigateToSignInPage(context);
                  },
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  static void showMessage(
      BuildContext context, String message, IconData iconData) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(message),
              Icon(iconData),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildRoundedNotificationLabel(BuildContext context,
      String message, Color color, double width, double height,double radius,) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Text(
        message,
        style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
