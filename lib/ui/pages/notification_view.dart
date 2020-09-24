import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/controller/notification_controller.dart';
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
      appBar: ApplicationBar.createNormalAppBar(
          context, "Notifications", true, true, null),
      drawer: MyMenu.getMyMenu(context),
      // body: DefaultComponents.buildNoDetailsWidget(context, Icons.notifications_off, "No Notifications to View."),
      body: ScopedModel(
        model: AppInit.currentApp,
        child: ScopedModelDescendant<AppInit>(
          builder: (BuildContext context, Widget widget, AppInit model) {
            return model.currentUserState
                ? ScopedModel(
                    model: NotificationController.currentController,
                    child: ScopedModelDescendant(
                      builder: (BuildContext context, Widget widget,
                          NotificationController model) {
                        if (model.isLoading) {
                          return _buildShimmerTile(context);
                        } else {
                          return model.isNotificationListEmpty
                              ? DefaultComponents.buildNoDetailsWidget(
                                  context,
                                  Icons.notifications_off,
                                  "No Notifications to view")
                              : SingleChildScrollView(
                                  child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        _buildNotificationList(context),
                                      ],
                                    ),
                                  ),
                                );
                        }
                      },
                    ),
                  )
                : DefaultComponents.buildUnSignedTile(
                    context, "Please Sign in to get notifications.");
          },
        ),
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context) {
    return ScopedModelDescendant(builder:
        (BuildContext context, Widget widget, NotificationController model) {
      return Container(
        height: MediaQuery.of(context).size.height - 87,
        child: FutureBuilder(
          future: model.getNotificationList,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return _buildShimmerTile(context);
            } else {
              if (model.isLoading) {
                return _buildShimmerTile(context);
              } else {
                model.setUnreadNotificationsAsRead();
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return NotificationComponents.buildNotificationTile(
                        context, snapshot.data[index]);
                  },
                  itemCount: snapshot.data.length,
                );
              }
            }
          },
        ),
      );
    });
  }

  _buildShimmerTile(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: ShimmerTile.withRadius(
            MediaQuery.of(context).size.width,
            150,
            context,
            10,
          ),
        );
      },
      itemCount: 5,
    );
  }
}
