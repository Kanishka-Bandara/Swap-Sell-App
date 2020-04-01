import 'package:scoped_model/scoped_model.dart';
import 'package:swap_sell/model/notification.dart';

class NotificationController extends Model {
  static NotificationController currentController;
  static List<Notification> _notifications;

  Future<List<Notification>> get notificationList async {
    return _notifications;
  }

  void removeNotification(int id) {
    _notifications.forEach((n) {
      if (n.getId == id) {
        _notifications.remove(n);
        notifyListeners();
      }
    });
  }
}
