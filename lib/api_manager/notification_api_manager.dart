import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:swap_sell/api_manager/url_holder.dart';
import 'package:swap_sell/model/default/notification.dart';

class NotificationApiManager {
  static NotificationApiManager defaultManager = NotificationApiManager();

  Future<List<Notification>> getNotificationList(int userId) async {
    List<Notification> l = [];
    print("Starting to get Notifications");
    var response =
        await http.get(URLHolder.ALL_NOTIFICATION_LIST_URL + "/$userId");
    if (response.statusCode == 200) {
      List a = json.decode(response.body);
      a.forEach((element) {
        l.add(Notification.fromJson(element));
      });
    }
    return l;
  }

  Future<bool> deleteNotification(int id, int userId) async {
    var response = await http.post(
      URLHolder.DELETE_NOTIFICATION_URL,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'id': id.toString(),
        'userId': userId.toString(),
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
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
    print("Starting to set as read");
    print(ids);
    var response = await http.post(
      URLHolder.SET_NOTIFICATION_AS_READ_BULK_URL + "/$userId",
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, List<int>>{
        'ids': ids,
      }),
    );
    if (response.statusCode == 200) {
      List r = json.decode(response.body);
      List<Notification> res = [];
      r.forEach((element) {
        res.add(Notification.fromJson(element));
      });
      return res;
    } else {
      return null;
    }
  }
}
