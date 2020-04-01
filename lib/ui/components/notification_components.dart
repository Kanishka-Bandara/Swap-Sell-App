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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextComponents.h3(context, notification.getNotificationHeader),
              IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 15,
                  ),
                  onPressed: () {
                    NotificationController.currentController.removeNotification(notification.getId);
                  }),
            ],
          ),
          TextComponents.paragraph(context, notification.getNotification)
        ],
      ),
    );
  }
}
