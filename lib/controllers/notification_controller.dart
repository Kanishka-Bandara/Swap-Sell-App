import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/api_manager/notification_api_manager.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/model/default/notification.dart';

class NotificationController extends Model {
  static NotificationController currentController = NotificationController();
  static List<Notification> _notifications = [];

  Future<List<Notification>> loadNotificationList() async {
    _notifications = [];
    List<Notification> l = await NotificationApiManager.defaultManager
        .getNotificationList(AppInit.currentApp.getCurrentUser.getId);
    l.forEach((element) {
      _notifications.add(element);
    });
    notifyListeners();
    return _notifications;
  }

  Future<List<Notification>> get getNotificationList async {
    return await loadNotificationList();
  }

  Future<bool> deleteNotification(int id) async {
    bool status = await NotificationApiManager.defaultManager
        .deleteNotification(id, AppInit.currentApp.getCurrentUser.getId);
    if (status) {
      _removeNotification(id);
    }
    return status;
  }

  Future<bool> setNotificationAsRead(int id) async {
    bool status = false;
    Notification n = await NotificationApiManager.defaultManager
        .setNotificationAsRead(id, AppInit.currentApp.getCurrentUser.getId);
    if (n != null) {
      for (var i = 0; i < _notifications.length; i++) {
        if (n.getId == id) {
          _notifications[i] = n;
          notifyListeners();
          status = true;
        }
      }
    }
    return status;
  }

  void _removeNotification(int id) {
    for (var i = 0; i < _notifications.length; i++) {
      Notification n = _notifications[i];
      if (n.getId == id) {
        _notifications.removeAt(i);
        notifyListeners();
      }
    }
  }

  bool get isNotificationListEmpty {
    if (_notifications.length == 0) {
      return true;
    } else {
      return false;
    }
  }
}
