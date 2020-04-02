import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/controllers/notification_controller.dart';
import 'package:swap_sell/ui/components/app_bar.dart';
import 'package:swap_sell/ui/components/default_components.dart';
import 'package:swap_sell/ui/components/my_menu.dart';
import 'package:swap_sell/ui/components/notification_components.dart';
import 'package:swap_sell/ui/components/shimmer_tile.dart';

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
      appBar: ApplicationBar.createNormalAppBar(context, "Notifications",true),
      drawer: MyMenu.getMyMenu(context),
      // body: DefaultComponents.buildNoDetailsWidget(context, Icons.notifications_off, "No Notifications to View."),
      body: SingleChildScrollView(
        child: ScopedModel(
          model: NotificationController.currentController,
          child: ScopedModelDescendant(builder: (BuildContext context,
              Widget widget, NotificationController model) {
            return Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: TextComponents.h1(context, "Notifications"),
                  //   ),
                  // ),
                  model.isNotificationListEmpty
                      ? DefaultComponents.buildNoDetailsWidget(context,
                          Icons.notifications_off, "No Notifications to view")
                      : _buildNotificationList(context),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context) {
    return ScopedModelDescendant(builder:
        (BuildContext context, Widget widget, NotificationController model) {
      return Container(
        height: MediaQuery.of(context).size.height-87,
        child: FutureBuilder(
          future: model.getNotificationList,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              // return Container(
              //   child: Center(
              //     child: Spinner.getSpinner(context, 15),
              //   ),
              // );
              return Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: ShimmerTile(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height, context),
              );
            } else {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return NotificationComponents.buildNotificationTile(
                      context, snapshot.data[index]);
                },
                itemCount: snapshot.data.length,
              );
            }
          },
        ),
      );
    });
  }
}