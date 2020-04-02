import 'package:flutter/material.dart';
import 'package:swap_sell/controllers/notification_controller.dart';
import 'package:swap_sell/model/default/notification.dart' as model;
import 'package:swap_sell/ui/components/text_components.dart';

class NotificationComponents {
  static buildNotificationTile(
      BuildContext context, model.Notification notification) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 400,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      // GestureDetector(
                      //   child: Icon(Icons.close),
                      //   onTap: () {
                      //     NotificationController.currentController
                      //         .removeNotification(notification.getId);
                      //   },
                      // ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        iconSize: 15,
                        icon: Icon(
                          Icons.close,
                        ),
                        onPressed: () {
                          NotificationController.currentController
                              .removeNotification(notification.getId);
                        },
                      )
                    ],
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    TextComponents.h3(
                        context, notification.getNotificationHeader)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TextComponents.paragraph(context, notification.getNotification)
        ],
      ),
    );
  }
}
