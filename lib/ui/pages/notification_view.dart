import 'package:flutter/material.dart';
import 'package:swap_sell/model/notification.dart' as notificationModel;
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/components/notification_components.dart';

class NotificationView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationViewState();
  }
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApplicationBar.createHomeAppBar(context),
      drawer: MyMenu.getMyMenu(context),
      // body: DefaultComponents.buildNoDetailsWidget(context, Icons.notifications_off, "No Notifications to View."),
      body: Column(
        children: <Widget>[
          NotificationComponents.buildNotificationTile(
            context,
            notificationModel.Notification(
                id: 1,
                notificationHeader: "Lorem Ipsum",
                notification:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis accumsan erat in cursus. Phasellus lobortis consectetur felis, nec gravida justo mattis eget. Nullam diam ante, euismod eget condimentum at, dignissim vulputate elit. Donec sollicitudin dignissim elit vel congue. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pharetra mi in vestibulum luctus. Suspendisse eu dapibus eros."),
          )
        ],
      ),
    );
  }
}
