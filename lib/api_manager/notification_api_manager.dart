import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/default/notification.dart';

class NotificationApiManager {
  static NotificationApiManager defaultManager = NotificationApiManager();
  static List<Notification> _notifications = [
    Notification(
      id: 1,
      notificationHeader: "Does the notification require an action?",
      isRead: false,
      notification:
          "For example, when your team just released a new feature and you would like your users to try it. This type of message prompts users to complete a certain action, and should be displayed differently in comparison to more passive messages.",
      state: 1,
    ),
    Notification(
      id: 2,
      notificationHeader: "Was the notification triggered by an event?",
      isRead: false,
      notification:
          "There are three types of events that can trigger a notification, depending on what events occured before:- triggered by the user: for example mobile messaging, where the content is directed specifically to a particular user- triggered by the system: specific to the system, for example a request to install an update",
      state: 1,
    ),
    Notification(
      id: 3,
      notificationHeader: "In-browser push notifications",
      isRead: false,
      notification:
          "When navigating to a website, we are sometimes asked if we would like to enable in-browser notifications. This type of notifications is difficult to design, as the value of the messages promised has to be high in order for users to agree to allow push notifications to appear. They also have to be enabled on every new device or browser.",
      state: 1,
    ),
    Notification(
      id: 4,
      notificationHeader: "In-app cards",
      isRead: false,
      notification:
          "Using a card or a banner format can be a good way to communicate less frequent messages. Fo example, Dropbox uses them frequently to remind users about their upgrade options. Quickbooks uses this format as part of on-boarding or reminding users about upcoming tax deadlines.",
      state: 1,
    ),
    Notification(
      id: 5,
      notificationHeader: "Modals/dialogs",
      isRead: true,
      notification:
          "A pop-up window can be used if an action requires immediate attention. However, this can be troublesome for the users and should be avoided if possible. Preferably this format would only be used if triggered by a specific action, when a user is more likely to expect it to appear. Ads suddenly appearing on a website, and stopping you from doing anything else unless you interact with the modal, are a great example of bad design.",
      state: 1,
    ),
    Notification(
      id: 6,
      notificationHeader: "In-context pop-ups",
      isRead: true,
      notification:
          "This type of notifications points the user into a right direction, and it is particularly useful for onboarding or for showing new features.",
      state: 1,
    ),
    Notification(
      id: 7,
      notificationHeader: "Does the notification require an action?",
      isRead: true,
      notification:
          "For example, when your team just released a new feature and you would like your users to try it. This type of message prompts users to complete a certain action, and should be displayed differently in comparison to more passive messages.",
      state: 1,
    ),
    Notification(
      id: 8,
      notificationHeader: "Was the notification triggered by an event?",
      isRead: true,
      notification:
          "There are three types of events that can trigger a notification, depending on what events occured before:- triggered by the user: for example mobile messaging, where the content is directed specifically to a particular user- triggered by the system: specific to the system, for example a request to install an update",
      state: 1,
    ),
    Notification(
      id: 9,
      notificationHeader: "In-browser push notifications",
      isRead: true,
      notification:
          "When navigating to a website, we are sometimes asked if we would like to enable in-browser notifications. This type of notifications is difficult to design, as the value of the messages promised has to be high in order for users to agree to allow push notifications to appear. They also have to be enabled on every new device or browser.",
      state: 1,
    ),
    Notification(
      id: 10,
      notificationHeader: "In-app cards",
      isRead: true,
      notification:
          "Using a card or a banner format can be a good way to communicate less frequent messages. Fo example, Dropbox uses them frequently to remind users about their upgrade options. Quickbooks uses this format as part of on-boarding or reminding users about upcoming tax deadlines.",
      state: 1,
    ),
    Notification(
      id: 11,
      notificationHeader: "Modals/dialogs",
      isRead: true,
      notification:
          "A pop-up window can be used if an action requires immediate attention. However, this can be troublesome for the users and should be avoided if possible. Preferably this format would only be used if triggered by a specific action, when a user is more likely to expect it to appear. Ads suddenly appearing on a website, and stopping you from doing anything else unless you interact with the modal, are a great example of bad design.",
      state: 1,
    ),
    Notification(
      id: 12,
      notificationHeader: "In-context pop-ups",
      notification:
          "This type of notifications points the user into a right direction, and it is particularly useful for onboarding or for showing new features.",
      isRead: true,
      state: 1,
    ),
  ];

  Future<List<Notification>> getNotificationList(int userId) async {
    return Future.delayed(Duration(seconds: 10), () => _notifications);
  }

  Future<bool> deleteNotification(int id, int userId) async {
    return true;
    // var response = await http.post(
    //   URLHolder.DELETE_NOTIFICATION_URL,
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode(<String, String>{
    //     'id': id.toString(),
    //     'userId': userId.toString(),
    //   }),
    // );
    // if (response.statusCode == 200) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<Notification> setNotificationAsRead(int id, int userId) async {
    var response = await http.post(
      URLHolder.SET_NOTIFICATION_AS_READ_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'id': id.toString(),
        'userId': userId.toString(),
      }),
    );
    if (response.statusCode == 200) {
      return Notification.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  Future<List<Notification>> setNotificationsAsRead(
      int userId, List<int> ids) async {
        return [];
    // var response = await http.post(
    //   URLHolder.SET_NOTIFICATION_AS_READ__BULK_URL + "/$userId",
    //   headers: <String, String>{
    //     'Content-Type': 'application/json',
    //   },
    //   body: jsonEncode(<String, List<int>>{
    //     'ids': ids,
    //   }),
    // );
    // if (response.statusCode == 200) {
    //   List r = json.decode(response.body);
    //   List<Notification> res = [];
    //   r.forEach((element) {
    //     res.add(Notification.fromJson(element));
    //   });
    //   return res;
    // } else {
    //   return null;
    // }
  }
}