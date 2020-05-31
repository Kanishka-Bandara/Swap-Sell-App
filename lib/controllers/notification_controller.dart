import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/api_manager/notification_api_manager.dart';
import 'package:swap_sell/config/init.dart';
import 'package:swap_sell/model/default/notification.dart';

class NotificationController extends Model {
  static NotificationController currentController = NotificationController();
  static Map<int, Notification> _notifications = {};
  bool _isLoding = false;

  Future<List<Notification>> fetchNotificationList() async {
    _notifications = {};
    if (!AppInit.currentApp.currentUserState) {
      return [];
    }
    this.setLoading = true;
    List<Notification> l = await NotificationApiManager.defaultManager
        .getNotificationList(AppInit.currentApp.getCurrentUser.getId);
    l.forEach((notification) {
      _notifications[notification.getId] = notification;
    });
    notifyListeners();
    this.setLoading = false;
    return _getNotificationAsList;
  }

  Future<List<Notification>> get getNotificationList async {
    return _getNotificationAsList;
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
      _notifications[n.getId] = n;
      notifyListeners();
    }
    return status;
  }

  Future<bool> setUnreadNotificationsAsRead() async {
    bool status = false;
    List<Notification> l = [];
    _notifications.forEach((k, n) {
      if (!n.getIsRead) {
        NotificationApiManager.defaultManager
            .setNotificationAsRead(
                n.getId, AppInit.currentApp.getCurrentUser.getId)
            .then((Notification notification) {
          l.add(notification);
        });
      }
    });
    l.forEach((notification) {
      _notifications[notification.getId] = notification;
      notifyListeners();
    });
    // notifyListeners();
    // List<int> list = getUnreadNotificationsIdList();
    // if (list.isNotEmpty) {
    // List<Notification> n = await NotificationApiManager.defaultManager
    //     .setNotificationsAsRead(AppInit.currentApp.getCurrentUser.getId,
    //         list);
    // if (n != null) {
    //   _notifications.forEach((n) {
    //     n.setIsRead = true;
    //   });
    //   status=true;
    // }
    // notifyListeners();
    // }
    return status;
  }

  void _removeNotification(int id) {
    for (var i = 0; i < _notifications.length; i++) {
      Notification n = _notifications[i];
      if (n.getId == id) {
        _notifications.remove(i);
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

  bool get isLoading => this._isLoding;
  set setLoading(bool state) {
    this._isLoding = state;
    notifyListeners();
  }

  List<int> getUnreadNotificationsIdList() {
    List<int> l = [];
    _notifications.forEach((k, n) {
      if (!n.getIsRead) {
        l.add(n.getId);
      }
    });
    return l;
  }

  int get getUnreadNotificationCount =>
      this.getUnreadNotificationsIdList().length;

  List<Notification> get _getNotificationAsList {
    List<Notification> l = [];
    _notifications.forEach((key, value) {
      l.add(value);
    });
    return l;
  }
}
